## Datasets

- **ms_mr_rnl dataset with mapping:** (Functions before, functions after, comments, map) : https://drive.switch.ch/index.php/s/RATgEwy6pluXzyx

- **ms_mr dataset with mapping:** (Functions before, functions after, map) : https://drive.switch.ch/index.php/s/3m1kujZxxeZRSPe

- **ms_mr_rnl dataset:** (Functions before, functions after, comments) : https://drive.switch.ch/index.php/s/hrh6Lz6aAymQolT

- **ms_mr dataset :** (Functions before, functions after) : https://drive.switch.ch/index.php/s/ygWhjX0weGVd1ww

---

In the beginning we have 1986 unique GitHub projects. The dataset contains 640671 review comments. After extracting methods `In_while` files contain 9912793 functions and `In_after` files contain 9970707 functions. Which makes a total of 19883500 functions. After linking the review comments to the functions we end up with 206124 functions that are associated with a
review comment.

Some filters were applied to the dataset to create the final datasets. As a result we end up with 8315 data points. More detailed information:

- Removed 20946 rows where ms and mr are the same. **206124** -> 185178
- Removed 94909 rows where rnl set has more than one comment. 185178 -> 90269
- Removed 53889 rows where ms or mr tokens length more than 100. 90269 -> 36380
- Removed 28065 rows where mr contains literals that are not present in the ms. 36380 -> **8315**

---

The 2-encoders model is trained with the review comment _rnl_ and the function that the comment is associated with _ms_.
The 1-encoder model is trained with the function on review _ms_ only.

## Results

- The 2-encoders model performs better than the 1-encoder model.
- Overall results are not as good as the results in the paper.
  - In the paper 1-encoder model with the beam size of 1 achieves 2.91% perfect prediction rate. In our experiment, the 1-encoder model with the beam size of 1 achieves 1.5% perfect prediction rate.
  - In the paper 1-encoder model with the beam size of 10 achieves 15.76% perfect prediction rate. In our experiment, the 1-encoder model with the beam size of 10 achieves 10.34% perfect prediction rate.
  - In the paper 2-encoders model with the beam size of 1 achieves 12.16% perfect prediction rate. In our experiment, the 2-encoders model with the beam size of 1 achieves 4.7% perfect prediction rate.
  - In the paper 2-encoders model with the beam size of 10 achieves 30.72% perfect prediction rate. In our experiment, the 2-encoders model with the beam size of 10 achieves 20.93% perfect prediction rate.
- This difference may be due to the difference in the dataset. The paper uses the dataset from both the Gerrit and the GitHub which creates a total of 17194 training data. However, our experiment uses the dataset from the GitHub only which creates a total of 8315 training data. Also the paper uses 2566 different GitHub projects while our experiment uses 1986 different GitHub projects.

## Quantitative Results

### Perfect Prediction

- 2 encoders 1 beam : Number of perfect predictions: 39 Percentage of perfect predictions: 4.696%
- 2 encoders 10 beam : Number of perfect predictions: 174 Percentage of perfect predictions: 20.93%
- 1 encoder 1 beam : Number of perfect predictions: 13 Percentage of perfect predictions: 1.56%
- 1 encoder 10 beam : Number of perfect predictions: 86 Percentage of perfect predictions: 10.34%

### BLEU-4 Score

- 2 encoders 1 beam: Mean BLEU-4 score: 0.7465828302804252 Median BLEU-4 score: 0.806244859667643 Standard deviation of BLEU-4 scores: 0.21109152652142416
- 2 encoders 10 beam: Mean BLEU-4 score: 0.8413821352028492 Median BLEU-4 score: 0.8877181162449961 Standard deviation of BLEU-4 scores: 0.1746417565171061
- 1 encoder 1 beam: Mean BLEU-4 score: 0.640549641986339 Median BLEU-4 score: 0.6681666024145695 Standard deviation of BLEU-4 scores: 0.1991601981851739
- 1 encoder 10 beam: Mean BLEU-4 score: 0.8004348076530787 Median BLEU-4 score: 0.8357923290864038 Standard deviation of BLEU-4 scores: 0.16923979934263209

### Levenshtein Distance

- 2 encoders 1 beam: Mean Levenshtein distance: 0.19628312500727477 Median Levenshtein distance: 0.15633423180592992 Standard deviation of Levenshtein distances: 0.1651623609796915
- 2 encoders 10 beam: Mean Levenshtein distance: 0.11752060521633477 Median Levenshtein distance: 0.07511737089201878 Standard deviation of Levenshtein distances: 0.1338770918353428
- 1 encoder 1 beam: Mean Levenshtein distance: 0.24845033371943762 Median Levenshtein distance: 0.22666666666666666 Standard deviation of Levenshtein distances: 0.15072091942034
- 1 encoder 10 beam: Mean Levenshtein distance: 0.14047421962304976 Median Levenshtein distance: 0.1144578313253012 Standard deviation of Levenshtein distances: 0.12646506714807748

## Sample Results

_Using 1 Beam_
<img width="1047" alt="image" src="https://user-images.githubusercontent.com/46859098/236647273-8dfcf692-7ca5-483c-8805-21accad00efc.png">
