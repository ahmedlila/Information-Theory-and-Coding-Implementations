%% [CIE 425] Assignment 1 - Question 1 
% Calculate the Entropy and Efficiency of Fixed Length Codeword
string= 'ShannonEntropy';
n = length(string);  % number of characters to report
%ACII => Distribute => Sort Descending 
% => Return Characters and their count
counts=hist(double(string), 0:255);
[r, c] = sort(counts, 'descend');
characters = char(c(1:n)-1);
counts=r(1:n);
denm=sum(counts);
prob=counts/denm; %array of probabilities for all character in the string 

% Calculating Source: 1- Information Amount 2- Entropy
entropy=0;
information=0;
for element= 1:length(counts)
    if prob(element)~=0
        fprintf("(Letter: %s): (Count: %d) (Probability: %.2f)\n", characters(element),counts(element),prob(element))
        entropy=entropy+prob(element)*log2(1/prob(element));
        information=information+log2(1/prob(element));
    end
end
fprintf("\n Results: \n String Count: %d   Total Probability: %.2f    Information Amount: %.4f    Entropy: %.4f", denm,sum(prob),information, entropy )

% ------------------------------- Efficiency -----------------------------

bits=ceil(log2(length(counts)));
L_avg= bits*sum(prob);
L_min=entropy;
efficiency=L_min/L_avg;
fprintf("\n Average Length word: %d - Efficiency: %.4f", bits,efficiency);

