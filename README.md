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

### Our Results

<p align="center">
  <img src="https://user-images.githubusercontent.com/46859098/236828974-4163bee2-f31d-4e1a-829b-028b05c670a7.png" />
</p>

| Encoder    | Beam Size | Perfect Predictions | Mean BLEU-4 | Median BLEU-4 | Std Dev BLEU-4 | Mean Lev. Dist | Median Lev. Dist | Std Dev Lev. Dist |
| ---------- | --------- | ------------------- | ----------- | ------------- | -------------- | -------------- | ---------------- | ----------------- |
| 1 Encoder  | 1         | 13 (1.56%)          | 0.6405      | 0.6682        | 0.1992         | 0.2485         | 0.2267           | 0.1507            |
| 1 Encoder  | 3         | 42 (5.05%)          | 0.7334      | 0.7619        | 0.1785         | 0.1877         | 0.1636           | 0.1371            |
| 1 Encoder  | 5         | 45 (5.41%)          | 0.7358      | 0.7618        | 0.1786         | 0.1815         | 0.1592           | 0.1362            |
| 1 Encoder  | 10        | 86 (10.34%)         | 0.8004      | 0.8358        | 0.1692         | 0.1405         | 0.1145           | 0.1265            |
| 2 Encoders | 1         | 40 (4.81%)          | 0.7466      | 0.8062        | 0.2111         | 0.1963         | 0.1563           | 0.1652            |
| 2 Encoders | 3         | 101 (12.15%)        | 0.8003      | 0.8540        | 0.1912         | 0.1509         | 0.1083           | 0.1481            |
| 2 Encoders | 5         | 124 (14.92%)        | 0.8192      | 0.8726        | 0.1831         | 0.1366         | 0.0945           | 0.1420            |
| 2 Encoders | 10        | 174 (20.93%)        | 0.8414      | 0.8877        | 0.1746         | 0.1175         | 0.0751           | 0.1339            |

### Original Paper Results

<p align="center">
<img width="797" alt="image" src="https://user-images.githubusercontent.com/46859098/236697247-3ab44877-0acb-4f1b-bbc0-e9a1d5788014.png">
</p>

## Comparison with the Original Paper

<div align="center">
<img src="https://user-images.githubusercontent.com/46859098/236834136-981be02f-42af-406f-9909-f5f558fe3101.png">

<img src="https://user-images.githubusercontent.com/46859098/236834162-05a337aa-3893-41b9-ae12-d361a78839ef.png">

<img src="https://user-images.githubusercontent.com/46859098/236834179-61ffefe8-3823-4ddf-a70c-3fb11a0a837f.png">

</div>

## Sample Results

_Using 1 Beam_
<img width="1047" alt="image" src="https://user-images.githubusercontent.com/46859098/236647273-8dfcf692-7ca5-483c-8805-21accad00efc.png">
