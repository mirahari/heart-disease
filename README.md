# Heart Disease Dataset 


## Introduction
Heart disease, also known as cardiovascular disease, is a disorder characterized by clogged blood vessels that can result in a heart attack[^1]. According to the World Health Organization, heart disease has been the greatest killer among diseases worldwide over the past 20 years[^2]. Every year, heart diseases have caused an estimated 17.9 million mortalities globally. It now accounts for 16% of total mortalities from all causes [^3]. 

Hence, it is essential to be knowledgeable about the symptoms and factors of heart disease as it is a major public health concern. By analyzing the healthcare data, we can gain profound insights into the disease. We can also use predictive modeling to predict the diagnosis, which may assist in the early detection and prevention of heart disease.

Risk factors of heart disease fall into three main categories[^4]:
1. Unchangeable risk factors - age, gender, heredity;
2. Modifiable risk factors - smoking, blood cholesterol, blood pressure, obesity, diabetes; and
3. Contributing risk factors - stress, alcohol, diet and nutrition.


## Data Dictionary

The dataset used in this report is the Statlog (Heart) dataset from UCI Machine Learning Repository[^5]. It consists of 270 observations and 14 variables.

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


### Exploratory Data Analysis 

![BAR : GENDER x TARGET](/img/bar.png)

[^1]: My reference.
[^1]: Cohn DP, Cohn DJ. Fighting the Silent Killer: How Men and Women Can Prevent and Cope with Heart Disease Today. 0th ed. A K Peters/CRC Press; 1993. doi:10.1201/9781439864753
[^2]: WHO reveals leading causes of death and disability worldwide: 2000-2019. December 2020. https://www.who.int/news/item/09-12-2020-who-reveals-leading-causes-of-death-and-disability-worldwide-2000-2019.
[^3]: New Straits Times. Heart disease top killer of Malaysians in 2019. NST Online. November 2020. https://www.nst.com.my/news/nation/2020/11/644515/heart-disease-top-killer-malaysians-2019. Accessed May 30, 2021.
[^4]: American Heart Association. Understand your risks to prevent a heart attack. June 2016. https://www.heart.org/en/health-topics/heart-attack/understand-your-risks-to-prevent-a-heart-attack. Accessed May 30, 2021.
[^5]: Dua D, Graff C. UCI machine learning repository. 2017. http://archive.ics.uci.edu/ml.
