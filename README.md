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

**Results**

- The 2-encoders model performs better than the 1-encoder model.
- Overall results are not as good as the results in the paper.
  - In the paper 1-encoder model with the beam size of 1 achieves 2.91% perfect prediction rate. In our experiment, the 1-encoder model with the beam size of 1 achieves 1.5% perfect prediction rate.
  - In the paper 2-encoders model with the beam size of 1 achieves 12.16% perfect prediction rate. In our experiment, the 2-encoders model with the beam size of 1 achieves 4.7% perfect prediction rate.
- This difference may be due to the difference in the dataset. The paper uses the dataset from both the Gerrit and the GitHub which creates a total of 17194 training data. However, our experiment uses the dataset from the GitHub only which creates a total of 8315 training data. Also the paper uses 2566 different GitHub projects while our experiment uses 1986 different GitHub projects.
