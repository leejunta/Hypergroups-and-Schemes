def hypmult(AS):
	maxrel=max(AS[1])
	hyptable=[[0 for x in range(maxrel)] for y in range(maxrel)]
	temp=[None]*(100*maxrel+maxrel)
	for i in range(1,maxrel+1):
		for j in range(1,maxrel+1):
			for f in range(1,len(AS)+1):
				for g in range(1,len(AS)+1):
					prod=AS[f-1][g-1]
					for h in range(1,len(AS)):
						if AS[f-1][h-1]==i and AS[h-1][g-1]==j:
							if temp[(i-1)*100+j-1]==None:
								temp[(i-1)*100+j-1]=[99]
								temp[(i-1)*100+j-1].append(prod)
								del temp[(i-1)*100+j-1][0]
							else:
								temp[(i-1)*100+j-1].append(prod)
							temp[(i-1)*100+j-1]=list(set(temp[(i-1)*100+j-1]))
			hyptable[i-1][j-1]=temp[(i-1)*100+j-1]
	return hyptable