# traffic_analysis
A set of methods to enable traffic classification using randomness tests. We also add an automated database creation algorithm.

Temporary cleaning the code to be updated. The code is fully parallelizable and requires no training.

Features:
1. Added database creation
2. Added randomness tests
3. Lacks evaluator (gamma-modified levels from 0.1 to 2, as in the original paper). 

**Note that the actual outcome is HEDGE with gamma =1, yet the best outcomes are obtained with higher gamma**. To enable fair comparison, the evaluator should be used. Contact us for more info. 


The code can be used if cited properly :

F. Casino, K. R. Choo and C. Patsakis, "HEDGE: Efficient Traffic Classification of Encrypted and Compressed Packets," in IEEE Transactions on Information Forensics and Security, vol. 14, no. 11, pp. 2916-2926, Nov. 2019.
doi: 10.1109/TIFS.2019.2911156

