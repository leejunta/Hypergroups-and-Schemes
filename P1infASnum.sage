#Checks number of contradictions
def P1infASnum(hypmult):
	import copy
	multtable=[[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0]]
	iterations=0
	contrtable=[]
	contradiction141324=[0,0,0]
	for i in range(1,4):
		bc=[None]
		multtable[0][1]=i
		if multtable[0][1]==1:
			multtable[1][0]=2
		if multtable[0][1]==2:
			multtable[1][0]=1
		if multtable[0][1]==3:
			multtable[1][0]=3

		for x in range(1,4):
			for y in range(1,4):
				if i in hypmult[x][y]:
					if bc==[None]:
						bc[0]=[x,y]
					else:
						bc.append([x,y])

		for j in range(0,len(bc)):
			multtable[0][2]=bc[j][0]
			multtable[2][1]=bc[j][1]
			if multtable[0][2]==1:
				multtable[2][0]=2
			if multtable[0][2]==2:
				multtable[2][0]=1
			if multtable[0][2]==3:
				multtable[2][0]=3
			if multtable[2][1]==1:
				multtable[1][2]=2
			if multtable[2][1]==2:
				multtable[1][2]=1
			if multtable[2][1]==3:
				multtable[1][2]=3

			for h in range(1,4):
				de=[None]
				multtable[0][4]=h
				if multtable[0][4]==1:
					multtable[4][0]=2
				if multtable[0][4]==2:
					multtable[4][0]=1
				if multtable[0][4]==3:
					multtable[4][0]=3

				for x in range(1,4):
					for y in range(1,4):
						if h in hypmult[x][y]:
							if de==[None]:
								de[0]=[x,y]
							else:
								de.append([x,y])
				for k in range(0,len(de)):
					multtable[0][3]=de[k][0]
					multtable[3][4]=de[k][1]

					if multtable[0][3]==1:
						multtable[3][0]=2
					if multtable[0][3]==2:
						multtable[3][0]=1
					if multtable[0][3]==3:
						multtable[3][0]=3
					if multtable[3][4]==1:
						multtable[4][3]=2
					if multtable[3][4]==2:
						multtable[4][3]=1
					if multtable[3][4]==3:
						multtable[4][3]=3


					cd1=list(hypmult[multtable[3][0]][multtable[0][2]])
					cd2=list(hypmult[multtable[2][0]][multtable[0][3]])
					for x in range(0,len(cd2)):
						if cd2[x]==1:
							cd2[x]=2
						elif cd2[x]==2:
							cd2[x]=1
					cd=list(set(cd1) & set(cd2))

					if cd==[]:
						print "Contradiction Found! Check vertices 2-3"
					if 0 in cd:
						cd.remove(0)

					for l in range(0,len(cd)):
						multtable[2][3]=cd[l]
						if multtable[2][3]==1:
							multtable[3][2]=2
						if multtable[2][3]==2:
							multtable[3][2]=1
						if multtable[2][3]==3:
							multtable[3][2]=3

						if multtable[0][2] not in list(hypmult[multtable[0][1]][multtable[1][2]]) or multtable[2][0] not in list(hypmult[multtable[2][1]][multtable[1][0]]) or multtable[1][2] not in list(hypmult[multtable[1][0]][multtable[0][2]]) or multtable[2][1] not in list(hypmult[multtable[2][0]][multtable[0][1]]) or multtable[0][2] not in list(hypmult[multtable[0][3]][multtable[3][2]]) or multtable[2][0] not in list(hypmult[multtable[2][3]][multtable[3][0]]) or multtable[0][3] not in list(hypmult[multtable[0][2]][multtable[2][3]]) or multtable[3][0] not in list(hypmult[multtable[3][2]][multtable[2][0]]) or multtable[0][3] not in list(hypmult[multtable[0][4]][multtable[4][3]]) or multtable[3][0] not in list(hypmult[multtable[3][4]][multtable[4][0]]) or multtable[3][4] not in list(hypmult[multtable[3][0]][multtable[0][4]]) or multtable[4][3] not in list(hypmult[multtable[4][0]][multtable[0][3]]):
							continue

						route11=list(hypmult[multtable[1][2]][multtable[2][3]])
						route12=list(hypmult[multtable[1][0]][multtable[0][3]])
						route13=list(hypmult[multtable[3][2]][multtable[2][1]])
						route14=list(hypmult[multtable[3][0]][multtable[0][1]])

						for x in range(0,len(route13)):
							if route13[x]==1:
								route13[x]=2
							elif route13[x]==2:
								route13[x]=1

						for x in range(0,len(route14)):
							if route14[x]==1:
								route14[x]=2
							elif route14[x]==2:
								route14[x]=1
						route1=list(set(route11) & set(route12) & set(route13) & set(route14))
						if route1==[]:
							print "Contradiction Found! Check vertices 1-3"
							contradiction141324[1]=contradiction141324[1]+1
						if 0 in route1:
							route1.remove(0)
						checking1=[]

						for m in range(0,len(route1)):
							multtable[1][3]=route1[m]
							if multtable[1][3]==1:
								multtable[3][1]=2
							if multtable[1][3]==2:
								multtable[3][1]=1
							if multtable[1][3]==3:
								multtable[3][1]=3

							route21=list(hypmult[multtable[2][3]][multtable[3][4]])
							route22=list(hypmult[multtable[2][0]][multtable[0][4]])
							route23=list(hypmult[multtable[4][3]][multtable[3][2]])
							route24=list(hypmult[multtable[4][0]][multtable[0][2]])



							for x in range(0,len(route23)):
								if route23[x]==1:
									route23[x]=2
								elif route23[x]==2:
									route23[x]=1
							for x in range(0,len(route24)):
								if route24[x]==1:
									route24[x]=2
								elif route24[x]==2:
									route24[x]=1
							route2=list(set(route21) & set(route22) & set(route23) & set(route24))
							if route2==[]:
								print "Contradiction Found! Check vertices 2-4"
								contradiction141324[2]=contradiction141324[2]+1
							if 0 in route2:
								route2.remove(0)

							for n in range(0,len(route2)):
								multtable[2][4]=route2[n]
								if multtable[2][4]==1:
									multtable[4][2]=2
								if multtable[2][4]==2:
									multtable[4][2]=1
								if multtable[2][4]==3:
									multtable[4][2]=3

								route31=list(hypmult[multtable[1][0]][multtable[0][4]])
								route32=list(hypmult[multtable[1][2]][multtable[2][4]])
								route33=list(hypmult[multtable[1][3]][multtable[3][4]])
								route34=list(hypmult[multtable[4][0]][multtable[0][1]])
								route35=list(hypmult[multtable[4][2]][multtable[2][1]])
								route36=list(hypmult[multtable[4][3]][multtable[3][1]])
								for x in range(0,len(route34)):
									if route34[x]==1:
										route34[x]=2
									elif route34[x]==2:
										route34[x]=1
								for x in range(0,len(route35)):
									if route35[x]==1:
										route35[x]=2
									elif route35[x]==2:
										route35[x]=1
								for x in range(0,len(route36)):
									if route36[x]==1:
										route36[x]=2
									elif route36[x]==2:
										route36[x]=1
								route3=list(set(route31) & set(route32) & set(route33) & set(route34) & set(route35) & set(route36))

								if route3==[]:
									checking1.append('C')
								else:
									checking1.append('NC')
									

								if m==(len(route1)-1) and n==(len(route2)-1):
									length=len(route1)*len(route2)
									if checking1==['C']*length:
										multtable[1][4]=None
										multtable[4][1]=None
										contradiction141324[0]=contradiction141324[0]+1
										print "Contradiction Found! Check vertices 1-4"
										contrtable.append(copy.deepcopy(multtable))
								if 0 in route3:
									route3.remove(0)

								for p in range(0,len(route3)):
									multtable[1][4]=route3[p]
									if multtable[1][4]==1:
										multtable[4][1]=2
									if multtable[1][4]==2:
										multtable[4][1]=1
									if multtable[1][4]==3:
										multtable[4][1]=3
									iterations=iterations+1
									print iterations
	print contradiction141324
	return contrtable