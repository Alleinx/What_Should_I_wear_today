# Need to launch server first
from xmlrpc.server import SimpleXMLRPCServer
from xmlrpc.server import SimpleXMLRPCRequestHandler
import requests
import json
import datetime
import numpy as np


class RequestHandler(SimpleXMLRPCRequestHandler):
    rpc_path = ('/RPC', )


with SimpleXMLRPCServer(('localhost', 8000), requestHandler=RequestHandler) as server:

    print('Server waiting...')
    server.register_introspection_functions()

    # Function Define Below:

    def get_average_temp():
        r = requests.get(
            'https://www.tianqiapi.com/api/?version=v1&cityid=101280701')
        r.encoding = 'utf-8'
        dt = datetime.datetime.now()

        parsed_json = json.loads(r.text)
        weather = []

        for i in range(len(parsed_json['data'])):
            for j in range(len(parsed_json['data'][i]['hours'])):
                if (parsed_json['data'][i]['hours'][j]['day'][:2] == str(dt.day)):
                    weather.append(
                        int(parsed_json['data'][i]['hours'][j]['tem'][:2]))

        return sum(weather)/len(weather)

    def getWearingResult(cloth_num, temperature, data):
        if cloth_num != 3:
            return -1

        h = 8.6125  # 空气交换系数
        body_temperature = 37.5
        # 分别对四种介质分割
        
        m1 = 6
        m2 = 60
        m3 = 36
        m4 = 50

        m = m1+m2+m3+m4  # 介质分割和
        n = 5400  # 对时间分割
        t = 5400  # 总时长

        # 四种材料厚度
        l1 = 0.001/1000
        l2 = data[2][3]/1000
        l3 = data[1][3]/1000
        l4 = data[0][3]/1000

        # 3四种材料的热传导率
        lam_1 = 0.027
        lam_2 = data[2][2]
        lam_3 = data[1][2]
        lam_4 = data[0][2]
        
        # 四种材料的密度
        de_1 = 1205
        de_2 = data[2][0]
        de_3 = data[1][0]
        de_4 = data[0][0]
        
        
        # 四种材料的比热容
        c1 = 1010
        c2 = data[2][1]
        c3 = data[1][1]
        c4 = data[0][1]
        
        # 计算热扩散率
        a1 = lam_1/(c1*de_1)  # I层材料的热扩散率
        a2 = lam_2/(c2*de_2)  # II层材料的热扩散率
        a3 = lam_3/(c3*de_3)  # III层材料的热扩散率
        a4 = lam_4/(c4*de_4)  # IV层材料的热扩散率

        # 材料长度分割和时间步长分割求解
        derta_x1 = l1/m1  # I层材料的分割长度
        derta_x2 = l2/m2  # II层材料的分割长度
        derta_x3 = l3/m3  # III层材料的分割长度
        derta_x4 = l4/m4  # IV层材料的分割长度
        derta_t = t/n  # 时间步长分割

        # 计算各层介质剖分的步长比
        r1 = derta_t/derta_x1**2*a1  # 第I层介质剖分的步长比
        r2 = derta_t/derta_x2**2*a2  # 第II层介质剖分的步长比
        r3 = derta_t/derta_x3**2*a3  # 第III层介质剖分的步长比
        r4 = derta_t/derta_x4**2*a4  # 第IV层介质剖分的步长比

        u = np.zeros(shape=(m+1, n+1))  # 定义四层耦合介质温度分布矩阵

        # 初始条件和边界条件
        u[:, 0] = body_temperature  # 初始条件
        u[0, :] = temperature  # 边界条件

        # 差分格式的系数矩阵的构造
        A = np.zeros(shape=(m, m))
        for i in range(0, m1-1):
            A[i, i] = 1+2*r1
            A[i, i+1] = -r1
            if i >= 1:
                A[i, i-1] = -r1

        A[m1-1, m1-1] = (lam_1/derta_x1+lam_2/derta_x2)
        A[m1-1, m1-2] = -lam_1/derta_x1
        A[m1-1, m1] = -lam_2/derta_x2

        for i in range(m1, m1+m2-1):
            A[i, i] = 1+2*r2
            A[i, i+1] = -r2
            A[i, i-1] = -r2

        A[m1+m2-1, m1+m2-1] = (lam_2/derta_x2+lam_3/derta_x3)
        A[m1+m2-1, m1+m2-2] = -lam_2/derta_x2
        A[m1+m2-1, m1+m2] = -lam_3/derta_x3

        for i in range(m1+m2, m1+m2+m3-1):
            A[i, i] = 1+2*r3
            A[i, i+1] = -r3
            A[i, i-1] = -r3

        A[m1+m2+m3-1, m1+m2+m3-1] = (lam_3/derta_x3+lam_4/derta_x4)
        A[m1+m2+m3-1, m1+m2+m3-2] = -lam_3/derta_x3
        A[m1+m2+m3-1, m1+m2+m3] = -lam_4/derta_x4

        for i in range(m1+m2+m3, m1+m2+m3+m4-1):
            A[i, i] = 1+2*r4
            A[i, i-1] = -r4
            A[i, i+1] = -r4

        A[m-1, m-1] = h+lam_4/derta_x4
        A[m-1, m-2] = -lam_4/derta_x4

    # 构造右端项
        for k in range(1, n+1):
            b = np.zeros(shape=(m, 1))
            for i in range(1, m-1):
                b[i, 0] = u[i+1, k-1]
            b[0, 0] = u[1, k-1]+r1*u[0, k]
            b[m1-1, 0] = 0
            b[m1+m2-1, 0] = 0
            b[m1+m2+m3-1, 0] = 0
            b[m-1, 0] = 37*h

        # 追赶法求解
            bb = np.diag(A)

            aa = np.transpose(np.concatenate([[0], np.diag(A, -1)]))
            c = np.transpose(np.diag(A, 1))

            N = len(bb)
            L = np.zeros(shape=(1, N))
            uu0 = 0
            y0 = 0
            aa[0] = 0
            y = np.zeros(shape=(1, N))
            x = np.zeros(shape=(1, N))
            uu = np.zeros(shape=(1, N-1))

            L[0, 0] = bb[0]-aa[0]*uu0
            y[0, 0] = (b[0]-y0*aa[0])/L[0, 0]
            uu[0, 0] = c[0]/L[0, 0]

            for i in range(1, N-1):
                L[0, i] = bb[i]-aa[i]*uu[0, i-1]
                y[0, i] = (b[i]-y[0, i-1]*aa[i])/L[0, i]
                uu[0, i] = c[i]/L[0, i]

            L[0, N-1] = bb[N-1]-aa[N-1]*uu[0, N-2]
            y[0, N-1] = (b[N-1]-y[0, N-2]*aa[N-1])/L[0, N-1]
            x[0, N-1] = y[0, N-1]

            for i in range(N-2, 0, -1):
                x[0, i] = y[0, i]-uu[0, i]*x[0, i+1]

            for j in range(0, m):
                u[j+1, k] = x[0, j]
        # u[1:m,k]=np.transpose(x)
        return float(u[m, n])

    server.register_function(get_average_temp, 'get_average_temp')
    server.register_function(getWearingResult, 'getWearingResult')
    server.serve_forever()
