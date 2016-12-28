# Realizing Hypergroups as Association Schemes

If you are interested in learning about realizing hypergroups as association schemes, here is a paper, presentation, and some code to get started. There is much to be explored in this field as it is relatively new. Please contact <leejunta@grinnell.edu> if you have any questions. A special thanks to Professor Christopher French at Grinnell College for advising myself and my colleague Bingyue He '18 on this project. 

We used SageMath (.sage), which uses Python syntax, for all computations. 

1) getmulttable.sage  
Input: relation table of an association scheme  
Output: corresponding hypermultiplication table  

2) P1infASproof.sage  
This code checks all pentagonal subsets of an infinite association scheme with 4 relations to find contradictions based on its hypermultiplication table.  
Input: hypermultiplication table  
Output: pentagonal structure with a contradiction  
Note: the code is a bit messy and has not been optimized for performance.  
