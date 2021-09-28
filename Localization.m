def sense(c, z, z1, sr, pm, p, rows, cols, a1, b1, c1):
    m=[]
    for i in range(rows):
        q=[]
        for j in range(cols):
            hit = (z == c[i][j]) 
            q.append(p[i][j] * ((hit) * sr + (1-hit) * (1-sr)))
        m.append(q)
    s=0
    for i in range(len(m)):
        s=s+sum(m[i])
    for i in range(len(m)):
        for j in range(len(m[0])):
            m[i][j]=m[i][j]/s
    return m

def move(c, z, z1, sr, pm, p, rows, cols, a1, b1, c1):
    m=[]
    for i in range(rows):
        q=[]
        for j in range(cols):
            s = pm * p[(i-z1[0]) % rows][(j-z1[1]) % cols]
            s = s + (1-pm) * p[(i-0) % rows][(j-0) % cols]
            q.append(s)
        m.append(q)
    return m

def localize(colors,measurements,motions,sensor_right,p_move):
    # initializes p to a uniform distribution over a grid of the same dimensions as colors
    pinit = 1.0 / float(len(colors)) / float(len(colors[0]))
    p = [[pinit for row in range(len(colors[0]))] for col in range(len(colors))]
    a1=[0,0]
    b1=[0,1]
    c1=[1,0]
    rows=len(p)
    cols=len(p[0])
    c = colors
    sr = sensor_right
    pm = p_move
    msr = measurements
    mtn = motions
    # >>> Insert your code here <<<
    for k in range(len(measurements)):
        p = move(c, msr[k], mtn[k], sr, pm, p, rows, cols, a1, b1, c1)
        p = sense(c, msr[k], mtn[k], sr, pm, p, rows, cols, a1, b1, c1)
    return p

def show(p):
    rows = ['[' + ','.join(map(lambda x: '{0:.5f}'.format(x),r)) + ']' for r in p]
    print '[' + ',\n '.join(rows) + ']'

colors = [['R','G','G','R','R'],
          ['R','R','G','R','R'],
          ['R','R','G','G','R'],
          ['R','R','R','R','R']]
measurements = ['G','G','G','G','G']
motions = [[0,0],[0,1],[1,0],[1,0],[0,1]]
p = localize(colors,measurements,motions,sensor_right = 0.7, p_move = 0.8)
show(p) # displays your answer