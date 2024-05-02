diary output_result
diary on
% ALGA (Linear Algebra and Analytical Geometry) - ASSIGNMENT
clc;

% Exercise 1
%A is the nutrients matrix, where each element a_ij represents the
%quantity of nutrient i found in 100 g of food j. 
A = [215       39          43       73        152        263        30       116           14       61.44     25       884      38      130       448.8     149        60          23      21       201     ;
     26        2.55        1.03     5.3       10.33      14.2       0.55      9.02         1.62     3.29      2.09      0       1.16     2.69      0        25.56     10.51        2.9     0.85      3.5   ;
     11.5      0.51        0.19     2.5       11.44      21.3       0.1       0.38         0.2      3.34      0.42    100       0.16     0.28     50.1       4.42      0.1         0.26    0.33     11     ;
      0        8.6        10.1      7.1        1.04       4.09      7.68     20.14         2.37     4.66      4.65      0       8.63    28.17      2.5       0         5.57        3.75    4.64     23.6   ;
      7       36          27       10         42        492.5      11        19           36      119.4       5         0.18   20       10         0        17        20         136       5       128     ;
      3.1      1.2         0.5      0.6        1.19       0.65      0.12      3.33         1.1      0.05      1.24      0.38    0.22     1.2       0         0.99      2.38        3.57    0.45      0.09  ;
     27       20          15        4          9         19.2       8        36            6       13.44     10         0.01   10       12         0        33        40          87      11        14     ;
    211       56          44       30        148        337         9       180           45       93.4     104         1.22   33       43         0       295       130          56      24       105     ;
    367      317         323       45        101         61.8     129       369          290      151.5     370         0     157       35         7.5     414       212         466     222       199     ;
     69       21          35      354        270       1116         0         2            8       49         4         0.04    3        1         0.5      86      5586          70       9        80     ;
   5290        0.33        0.2      0.4        0.92       2.88      0.07      1.27         0.25     0.38      0.73      0.06    0.19     0.49      0         0.71      0.43        0.76    0.09     0.69   ;
      0.143    0.083       0.047    0.1        0.013      0.032     0.044     0.251        0.037    0.01      0.492     0       0.06     0.069     0         0.099     0.135       0.174   0.074    0.023  ;
      0       62           9.3      0          0          0        38.1       1.5         24        0.94      3.5       0       6.4      0         0         0         0           9.8    19.1      0.6    ;
      0.11     0.107       0.097    0.03       0.044      0.154     0.034     0.169        0.1      0.038     0.102     0       0.042    0.163     0         0.196     0.059       0.095   0.059    0.041  ;
      0.25     0.08        0.059    0.07       0.399      0.844     0.02      0.073        0.1      0.162     0.449     0       0.02     0.013     0         0.073     0.152       0.236   0.048    0.24   ;
      4.63     0.607       0.928    1.8        0.058      0.991     0.191     1.06         0.5      0.084     4.116     0       0.148    1.476     0         8.526     3.951       0.49    0.628    0.116  ;
      0.34     0.252       0.197   15          0.934      0.967     0.283     0.638        0.17     0.314     2.2       0       0.106    0.39      0         0.865     0.376       0.145   0.247    0.581  ;
      0.4      0.178     147        0.02       0.109      0.424     0.042     0.178        0.047    0.042     0.097     0       0.116    0.093     0         0.231     0.2         0.242   0.08     0.048  ;
      2.27     0           0        0.13       0.7        1.69      0         0            0        0.357     0         0       0        0         0         3.46      0           0       0        0.39   ;
      0      719       28129      509        654        447       259         8         2600      126         0         0       0        0         0       136         0        8190     623      409     ]

%D is a diagonal matrix, where each element d_jj represents the weight, where one unit equals 100 grams, of a standard kitchen unit of food j.
d = [ 1.70 0.78 0.61 2.40 0.61 0.38 1.23 1.98 0.28 2.44 0.35 0.135 1.10 1.58 2.50 1.24 0.18 1.80 1.23 0.66 ]' ;
D = diag( d )
%The matrix N, resulting from the product A*D, indicates the quantity of nutrients found in one standard kitchen unit of each of the foods.
N = A*D

%Spinach omelet: 1/4 cup of spinach, 2 eggs, 1/8 cup of milk, 1/2 tablespoon of oil.
%For a spinach omelet, half the standard unit of spinach is consumed, twice the amount of eggs, one-eighth the amount of milk,
%and half the amount of oil. Thus, the quantity of carbohydrates for this dish is given by O = (1/2) * N(4,18) + (2) * N(4,5) + (1/8) * N(4,10) + (1/2) * N(4,12);
O = (1/2)*N(4,18) + (2)*N(4,5) + (1/8)*N(4,10) + (1/2)*N(4,12)

%Greek salad: one cup of lettuce, 2 eggs, 1/4 cup of feta cheese, 1/2 tomato, 1/8 cup of mayonnaise.
%As for the Greek salad, twice the standard unit of lettuce is consumed, twice the amount of eggs, one of feta cheese, half of the tomato, and one-eighth of the mayonnaise.
%The quantity of carbohydrates for this dish is given by G = (2)*N(4,9) + (2)*N(4,5) + (1)*N(4,6) + (1/2)*N(4,19) + (1/8)*N(4,15);
G = (2)*N(4,9) + (2)*N(4,5) + (1)*N(4,6) + (1/2)*N(4,19) + (1/8)*N(4,15)

%In this sense, since in most cases low-carb diets are desired for weight loss, the most suitable dish for a weight loss diet is the omelet, because
%it has a lower amount of carbohydrates in its composition.

% Exercise 2a)

%Matrix B denotes the required nutrients in the problem (the independent term);
B = [575; 50; 6; 3.5]
%AMatrix I is a matrix where its elements represent the quantity of the required nutrients in one standard kitchen unit of each of the selected ingredients in the problem.
I = [N(1,1) N(1,12) N(1,13) N(1,17); N(2,1) N(2,12) N(2,13) N(2,17); N(4,1) N(4,12) N(4,13) N(4,17); N(13,1) N(13,12) N(13,13) N(13,17)]
%Matrix S is the matrix containing the set of solutions to the problem;
S = I\B
%To analyze the solutions of the system, we need to know the characteristics of the matrix I and the augmented matrix [I|B];
car_I = rank(I)
car_IB = rank([I B])
%Since the rank of I is equal to the rank of [I|B], the problem has only one solution.

% Exercise 2b)

%The solution to the previous problem (the recipe) was expressed in terms of values in standard kitchen units of the ingredients.
quant_steak = S(1,1)
quant_oil = S(2,1)
quant_onion = S(3,1)
quant_sauce = S(4,1)
%By approximation, the recipe would be: one steak, one and a quarter tablespoon of oil, half an onion, one and a quarter tablespoon of soy sauce.

% Exercise 3a)

%V describes the desired daily combination of nutrients for the sumo wrestler;
V = [2884.1; 210; 113.5; 266.1; 1533; 44.3; 774.2; 2855; 7638; 3040.5; 18000; 3; 340; 2.8; 4; 46.3; 46.5; 183.8; 14.75; 71275]
%C describes the set of solutions to achieve the values of the sumo wrestler's diet;
C = N\V
%The elements of the possible solutions of the problem, that is, the elements of matrix C,
%which are not null or negative, indicate the foods that can form a combination of foods for that combination of nutrients.

% Exercise 3b)

%2 steaks, 3 cups of Brussels sprouts, two carrots, one cup of chicken soup, one egg, 3/4 cup of lentils,
%one and a half cups of lettuce, two cups of milk, one cup of mushrooms, 5 tablespoons of oil, 3 onions, 2 cups of rice,
%half a salmon fillet, one tablespoon of soy sauce, 2 cups of spinach, and half a cup of vanilla ice cream.

% Exercise 3c)

%Matrix E represents the rounded quantities in standard kitchen units of the selected foods in the previous step.
E = [2; 6; 2; 1; 1; 0; 0; 0.75; 3; 2; 2; 5; 3; 2; 0; 1; 1; 2; 0; 1]
%Matrix R denotes the quantity of nutrients obtained with the approximations made in matrix E.
R = N*E
%Therefore, by reading matrix R, it is observed that some obtained values are slightly different from the desired values.
diary off



