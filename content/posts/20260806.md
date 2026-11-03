+++
title = 'Statistics Learning'
date = 2026-08-06T10:38:00+08:00
draft = false
description = "A blog about what I've learned in statistics crash course"
tags = ['statistics']
+++

Lately, I've been studying statistics to prepare for a potential PhD position. This is quite a new field for me; my background in Software Engineering and Business Administration didn't provide sufficient training in statistical fundamentals.

Here is a summary of what I’ve learned so far:

Naturally, with a large dataset, data tend to follow a **normal distribution**. However, when working with a small sample size, the data are considered more volatile and are better modeled by the **t-distribution** (often referred to in the context of Student's t-test), rather than the z-distribution.

{{< youtube uAxyI_XfqXk >}}

Once we model the distribution of our data, we can calculate the **confidence interval**. This represents the range in which we expect the true population parameter (such as the mean) to lie; for instance, with a 95% confidence interval, we can say that if we repeated an experiment 100 times, the true mean would fall within that interval 95 times.

Furthermore, we use the **p-value** to evaluate the robustness of our conclusions. We generally use a **t-test** to determine if there is a significant difference between group means. An **F-test** is used to assess whether variances are significantly different—this is crucial in ANOVA to determine if the explained variance by a model is substantial enough to reject the null hypothesis. Finally, the **Chi-square test** is employed for categorical data across multiple groups to determine if observed frequencies differ significantly from expected frequencies.

The general logic behind most statistical tests can be summarized by this formula:

$$
\text{Statistical Test Statistic} = \frac{\text{Observed Difference} - \text{Expected Value under Null Hypothesis}}{\text{Measure of Variation (Standard Error)}}
$$

{{< youtube QZ7kgmhdIwA >}}




