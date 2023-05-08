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
- The findings in our study are consistent with those presented in the paper, although they are not identical and do not achieve the same level of quality. It should be noted that the differences between them are understandable, as they may be due to the difference in the dataset. Specifically, the paper uses a dataset consisting of both Gerrit and GitHub data, which results in a total of 17,194 training data. In contrast, our experiment only uses data from GitHub, resulting in a total of 8,315 training data. Additionally, the paper uses 2,566 different GitHub projects, while our experiment uses 1,986 different GitHub projects.

## Quantitative Results

| Encoder    | Beam Size | Perfect Predictions | Mean BLEU-4 | Median BLEU-4 | Std Dev BLEU-4 | Mean Lev. Dist | Median Lev. Dist | Std Dev Lev. Dist |
| ---------- | --------- | ------------------- | ----------- | ------------- | -------------- | -------------- | ---------------- | ----------------- |
| 1 Encoder  | 1         | 13 (1.56%)          | 0.6405      | 0.6682        | 0.1992         | 0.2485         | 0.2267           | 0.1507            |
| 1 Encoder  | 10        | 86 (10.34%)         | 0.8004      | 0.8358        | 0.1692         | 0.1405         | 0.1145           | 0.1265            |
| 2 Encoders | 1         | 39 (4.696%)         | 0.7466      | 0.8062        | 0.2111         | 0.1963         | 0.1563           | 0.1652            |
| 2 Encoders | 10        | 174 (20.93%)        | 0.8414      | 0.8877        | 0.1746         | 0.1175         | 0.0751           | 0.1339            |

### Original Paper Results

<img width="797" alt="image" src="https://user-images.githubusercontent.com/46859098/236697247-3ab44877-0acb-4f1b-bbc0-e9a1d5788014.png">

## Sample Results

_Using 1 Beam_
<img width="1047" alt="image" src="https://user-images.githubusercontent.com/46859098/236647273-8dfcf692-7ca5-483c-8805-21accad00efc.png">
