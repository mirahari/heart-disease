# Heart Disease Dataset 


## Introduction
Heart disease, also known as cardiovascular disease, is a disorder characterized by clogged blood vessels that can result in a heart attack[^1]. According to the World Health Organization, heart disease has been the greatest killer among diseases worldwide over the past 20 years[^2]. Every year, heart diseases have caused an estimated 17.9 million mortalities globally. It now accounts for 16% of total mortalities from all causes [^3]. 

Hence, it is essential to be knowledgeable about the symptoms and factors of heart disease as it is a major public health concern. By analyzing the healthcare data, we can gain profound insights into the disease. We can also use predictive modeling to predict the diagnosis, which may assist in the early detection and prevention of heart disease.

Risk factors of heart disease fall into three main categories[^4]:
1. Unchangeable risk factors - age, gender, heredity;
2. Modifiable risk factors - smoking, blood cholesterol, blood pressure, obesity, diabetes; and
3. Contributing risk factors - stress, alcohol, diet and nutrition.

<br>

## Data Dictionary

The dataset used in this report is the [Statlog (Heart) dataset from UCI Machine Learning Repository](https://archive.ics.uci.edu/ml/datasets/Statlog+%28Heart%29). It consists of 270 observations and 14 variables.

| No. | Names | Description | Measurement |
| :-: | :--------- | :--------- | :--------- |
| 1 | age | Age | in years |
| 2 | sex | Sex | 0 = female, 1 = male |
| 3 | cp | Chest pain type | 1 = typical angina, 2 = atypical angina, 3 = non-anginal pain, 4 = asymptomatic |
| 4 | restbp | Resting blood pressure | in mm Hg |
| 5 | chol | Serum cholesterol | in mg/dl |
| 6 | fbs | Fasting blood sugar > 120 mg/dl | 0 = false, 1 = true |
| 7 | ecg | Resting electrocardiographic results | 0 = normal, 1 = ST-T wave abnormality, 2 = left ventricular hypertrophy |
| 8 | hrate | Max heart rate achieved | integer |
| 9 | exang | Exercise induced angina | 0 = no, 1 = yes |
| 10 | stdep | ST depression induced by exercise relative to rest | integer or float |
| 11 | slope | The slope of the peak exercise ST segment | 1 = upsloping, 2 = flat, 3 = downsloping |
| 12 | fluor | Number of major vessels colored by fluoroscopy | 0 - 3 |
| 13 | thal | Thallium stress test results | 3 = normal, 6 = fixed, 7 = reversible |
| 14 | target | Diagnosis of heart disease | 1 = absent, 2 = present |

The variables include risk factors (age, sex, blood pressure, cholesterol, blood sugar), symptoms (chest pain, exerciseinduced angina), test results (resting electrocardiography, max heart rate, ST depression, ST segment, fluoroscopy, thallium stress test) and finally the target variable (diagnosis of heart disease)

<br>

## Exploratory Data Analysis 
Throughout this section, different methods of visualisations are applied to investigate and reveal the relationships between variables.

### Question 1

#### Which gender has a higher risk of heart disease?

![BAR : GENDER x TARGET](/img/bar.png)

The bar chart above illustrates the percentage of heart disease occurrence in different genders. Among female respondents, less than a quarter of them are diagnosed with heart disease. Contrarily, heart disease is present in more than half of the male respondents. Hence, it can be said that male has a higher risk than female.

Due to men’s higher absolute risk relative to women, cardiovascular disease has been seen as a male disease for a long time. There are a variety of reasons that can explain the gender difference in heart disease. For instance, psychosocial and behavioral factors such as excessive alcohol consumption and smoking, are in favor of women[^5].


![BOX : GENDER x AGE x TARGET](/img/box.png)
As shown in the boxplot, there is an age gap between genders in terms of heart disease diagnosis. The interquartile range for men with heart disease is much larger than their female counterparts. The boxplot for female with heart disease is also heavily skewed to the left in comparison with male’s, indicating that female get heart disease later in
life. A study in 2010 has revealed that cardiovascular disease develops 7 to 10 years later in women than in men. In spite of that, it remains the leading cause of mortality in women[^6].

Heart attack can be more fatal in women. Due to their smaller body size and blood vessels, blockages of the same size can be more serious. The narrower vessel channel also makes surgery and angioplasty procedures more complicated[^1]. Hence, the risk should not be underestimated due to the false sense of security that females are protected against cardiovascular disease[^6].

### Question 2

#### What is the relationship between heart rate and age?

## References

[^1]: Cohn DP, Cohn DJ. Fighting the Silent Killer: How Men and Women Can Prevent and Cope with Heart Disease Today. 0th ed. A K Peters/CRC Press; 1993. doi:10.1201/9781439864753
[^2]: WHO reveals leading causes of death and disability worldwide: 2000-2019. December 2020. https://www.who.int/news/item/09-12-2020-who-reveals-leading-causes-of-death-and-disability-worldwide-2000-2019.
[^3]: New Straits Times. Heart disease top killer of Malaysians in 2019. NST Online. November 2020. https://www.nst.com.my/news/nation/2020/11/644515/heart-disease-top-killer-malaysians-2019. Accessed May 30, 2021.
[^4]: American Heart Association. Understand your risks to prevent a heart attack. June 2016. https://www.heart.org/en/health-topics/heart-attack/understand-your-risks-to-prevent-a-heart-attack. Accessed May 30, 2021.
[^5]: Weidner G. Why do men get more heart disease than women? An international perspective. Journal of American College Health. 2000;48(6):291-294. doi:10.1080/07448480009596270
[^6]: Maas AHEM, Appelman YEA. Gender differences in coronary heart disease. Netherlands Heart Journal. 2010;18(12):598-603. doi:10.1007/s12471-010-0841-y


10. Kostis JB, Moreyra AE, Amendo MT, Di Pietro J, Cosgrove N, Kuo PT. The effect of age on heart rate in
subjects free of heart disease. Studies by ambulatory electrocardiography and maximal exercise stress test.
Circulation. 1982;65(1):141-145. doi:10.1161/01.CIR.65.1.141
16Heart Disease Prediction
11. Dworkin G. Changes in max heart rate with aging. Vein Specialists of Tampa. February 2017. https://www.
tampaveinspecialists.com/changes-in-max-heart-rate-with-aging/. Accessed May 30, 2021.
12. American Heart Association. Angina(Chest pain). Angina (Chest Pain). July 2015. https://www.heart.org/en/
health-topics/heart-attack/angina-chest-pain. Accessed May 30, 2021.
13. Wong C-K. Recognising ”painless” heart attacks. Heart. 2002;87(1):3-5. doi:10.1136/heart.87.1.3
14. Brown CF, Oldridge NB. Exercise-induced angina in the cold: Medicine & Science in Sports & Exercise.
1985;17(5):607???612. doi:10.1249/00005768-198510000-00015
15. Nelson J. Thallium stress test: Purpose, procedure, and risks. Healthline. June 2012. https://www.healthline.
com/health/thallium-stress-test.
16. Tighe DA, Gentile BA, Chung EK, eds. Pocket Guide to Stress Testing. Second edition. Hoboken, NJ: Wiley;
2020.
17. Ashley EA, Niebauer J. Cardiology Explained. London: Remedica Medical Education; Publishing; 2004.
18. Okin PM, Devereux RB, Kors JA, et al. Computerized st depression analysis improves prediction of all-cause
and cardiovascular mortality: The strong heart study. Annals of Noninvasive Electrocardiology. 2001;6(2):107-
116. doi:10.1111/j.1542-474X.2001.tb00094.x
19. Rawshani A. The ST segment: Physiology, normal appearance, ST depression & ST elevation. ECG & Echo
Learning. August 2018. https://ecgwaves.com/st-segment-normal-abnormal-depression-elevation-causes/.
Accessed May 30, 2021.
20. Hill J. ABC of clinical electrocardiography: Exercise tolerance testing. BMJ. 2002;324(7345):1084-1087.
doi:10.1136/bmj.324.7345.1084
21. Rokach L, Maimon O. Data Mining with Decision Trees: Theory and Applications. Second edition. Hackensack, New Jersey: World Scientific; 2015.
22. Mingers J. An Empirical Comparison of Pruning Methods for Decision Tree Induction. Machine Learning.
1989;4(2):227-243. doi:10.1023/A:1022604100933
