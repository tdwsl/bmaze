0 rem Maze generator for bwbasic
5 w=25: h=19: dim m(w*h)
6 dim s(150) : p = 0
7 d = 2110
8 data 0,-1, 1,0, 0,1, -1,0
9 dim c(4)
10 for i=0 to w*h-1
15 m(i) = 1
20 next
25 gosub 200
30 gosub 100
35 end
100 rem Print maze
105 for i=0 to h-1
110 for j=0 to w-1
115 t = m(i*w+j)
116 if t=0 then print ".";
117 if t=1 then print "#";
118 if t=2 then print "S";
119 if t=3 then print "X";
120 print " ";
125 next
130 print
135 next
140 return
200 rem Generate maze
205 x=int(rnd*int(w/2))*2+1: y=int(rnd*int(h/2))*2+1
206 sx=x:sy=y
207 mx=0
215 s(p)=x:p=p+1:s(p)=y:p=p+1
220 p=p-1:y=s(p):p=p-1:x=s(p)
225 m(y*w+x)=0
226 c(0)=0:c(1)=1:c(2)=2:c(3)=3:cn=4
230 for i=1 to 4
231 r=int(rnd*cn): restore 8
234 for j=0 to c(r)
235 read xd:read yd
236 next
237 xx=x+xd*2:yy=y+yd*2
239 cn=cn-1:c(r)=c(cn)
240 if xx<0 or yy<0 or xx>=w or yy>=h then 260
245 if m(yy*w+xx)=0 then 260
250 s(p)=xx:p=p+1:s(p)=yy:p=p+1
251 if p>mx then mx=p: ex=xx: ey=yy
255 m(yy*w+xx)=0 : m((y+yd)*w+x+xd)=0
260 next
265 if p<>0 then 220
270 m(ey*w+ex)=3: m(sy*w+sx)=2
275 return
