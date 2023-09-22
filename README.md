![ex0525_banner](images/ex0525_BANNER.jpg)
# [US Income Analysis](ex0525_ANALYSIS.pdf)
- **Introduction**: As a data scientist, Duy is requested to query a subset of the incomes of Americans. This subset consists of Americans and their distributions of annual incomes in five different education categories (less than 12 years, 12 years, 13-15 years, 16 years, and more than 16 years) with a certain classified condition in 2005.
- **What's In The Data**: It contains 12,000+ rows, each depicting a person with two features, where one feature consists of the five education categories, and the other consists of their income. The subset can be seen in [ex0525.csv](data/ex0525.csv).
- **Assumptions**: Appropriate assumptions are established in preparation for Analysis of Variance (ANOVA) testing by visualizing before and after logarithmic transformation.
- **Problem Statements**: The addressed problem statements are as follows:
  - **1**. Test if at least one of the five distributions of educated people is different from the other distributions. This is a necessary step prior to pairwise comparisons.
  - **2**. Test if people with a Bachelors (16 years of education) have different distributions of income than people with graduate-level education (more than 16 years of education) using an Extra Sum of Squares Test.
  - **3**. Test if at least one of the five distributions of educated people is different from the other distributions, but assumes that there is no equal standard deviation for the logged data. Using Welch's ANOVA Test is most appropriate for this task, since it does not assume equal variance.
  - **4**. Determine which pairs of education category distributions differ and by how much money or percentage using the Tukey-Kramer test.
  - **5**. Test if there is a difference in income distributions between people with high school education (12 years) versus the other education categories using Dunnett's Test.
