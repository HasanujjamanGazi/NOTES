### PANDAS

```python
import pandas as pd
```

#### DATA
```python
data = {
    "name" : ["Panna", "Hasan", "Hena", "Chini", "Amy", "ShuangJiang", "DuanJiaxu", "SuZhiZhi"],
    "age" : [23, 32, 38, 36, 75, 25, 57 ,35],
}

# ADD EMAIL
data["email"] = [f"{x[0]}.{x[1]}@email.com" for x in zip(data["name"], data["age"])]

```

#### DATA FRAME CREATION

> We can make DataFrame we can read data from files (csv, excel, json, etc) to make one.

```python
# Creating DataFrame from files.
df = pd.read_csv("file_path/file.csv")
df = pd.read_json("file_path/file.json")
df = pd.read_excel("file_path/file.xlsx")

```

> We can create DataFrame on our own with dictionary.

```python
# Creating DataFrame from dictionary
df = pd.DataFrame(data)
```

#### SAVING

> We can save/convert our DataFrame to various file format like json, csv, excel etc.

```python
# Saving DataFrame to files.
df.to_json("json_out_put.json", indent=2, index=False)
# (file-path/name-if-same-folder)
```
#### UNDERSTANDING DATA SET

> We can display data from top/bottom.

```python
# This will display the 5 rows from the top by default or the specified number of rows
df.head(n)      # (n=int)

# This will display the 5 rows from the top by default or the specified number of rows
df.tail(n)      # (n=int)
```

> We have `info()` to summarize the dataset.

```python
df.info()
# <class 'pandas.DataFrame'>
# RangeIndex: 8 entries, 0 to 7
# Data columns (total 3 columns):
#  #   Column  Non-Null Count  Dtype
# ---  ------  --------------  -----
#  0   name    8 non-null      str  
#  1   age     8 non-null      int64
#  2   email   8 non-null      str  
# dtypes: int64(1), str(2)
# memory usage: 324.0 bytes
# None
```

> We have describe() method in pandas to get descriptive statistics of the dataset. Like It will provide use -

- Count
- Mean 
- STD (Standard Deviation)
- Min
- 25%
- 50%
- 75%
- Max

```python
df.describe()
```

> We can get the shape of our DataFrame with `.Shape` & columns with `.columns` attributes. It means we don't use parenthesis.

```python
df.shape      # (8, 3)
df.columns    # Index(['name', 'age', 'email'], dtype='str')
```

#### SELECTING COLUMNS

> We can select a specific column with `df["column1"]` & multiple columns with `df["column1", "column2", ....]`

#### FILTERING ROWS (BOOLEAN INDEXING)

```python
df[(df["column_n"] < 70)]
# In this above line we are passing the column Which is the basis of filtering then the filter(condition) itself.

# We can do multiple condition like this.
df[(df["column_n"] < 70) | df[(df["column_n"] > 20)]]

# | for OR
# & for AND
# ~ for NOT
```

> We can also filter with `df.loc[]`, `df.query()` & check if value exists a list.

```python
# Just better with label based selections.
filtered_df = df.loc[(df['Age'] < 30) | (df['City'] == 'New York')]

# String based syntax to filter.
filtered_df = df.query('Age > 25 and Salary < 100000')

# Filter for rows where City is either 'London' or 'Paris'
filtered_df = df[df['City'].isin(['London', 'Paris'])]
```

#### ADD NEW COLUMN

> We can add column with `[]` & `insert()`.

```python
df["new_column"] = value
# Example
df["bonus"] = df["salary"] * 0.2

# With insert()
df.insert(location, "Column Name", value_to_be_added)
```

#### UPDATE VALUE

> To update specific values in DataFrame use `.loc[]`.

```python
df.loc[row_index, column_name] = new_value
```

> To update multiple values in DataFrame use `[]` method and combine various conditions.

```python
# It will change the whole column.
df["salary"] = df["salary"] * 1.07
```

#### REMOVING COLUMNS

> To drop/delete columns use `drop()`.

```python
df.drop(columns=["column name"], inplace=true)
# We pass the column name which we wanna delete.
# inplace=True : modify the original DataFrame | inplace=False : return new DataFrame.
# If multiple :
df.drop(columns=["column1", "column2"], inplace=true)
```

### HANDLING MISSING VALUES

#### IDENTIFYING MISSING VALUES

>  We can locate missing values with `.isnull()`.

```python
# It will return boolean in DataFrame
df.isnull()
#     name    age  email  salary
# 0  False  False  False   False
# 1  False  False  False   False
# 2  False  False  False   False
# 3  False  False  False   False
# 4   True   True  False   False
# 5  False  False  False   False
# 6  False  False  False   False
# 7  False  False  False   False
```

> To get a quick summary of missing values use `isnull().sum()`.

```python
# It will return a series of numbers representing the missing values n each columns.
df.isnull().sum()
# name      1
# age       1
# email     0
# salary    0
# dtype: int64
```

#### HANDLING MISSING VALUES

> One of the way to handle missing value is if there is missing values in rows/columns that is no use to us then drop the whole row/column with `dropna()`.

> Remember it will drop all the rows/columns with missing values.

```python
df.dropna(axis, inplace=True)
# Default axis is 0
# axis = 0 to drop the row with missing values.
# axis = 0 to drop the columns with missing values.
```

> Another way to handle missing value is to fill some reasonable data at the missing place with `fillna()`.

```python
# It will replace all the missing values with the given --value.
df.fillna(values=clean_value, inplace=True)
# We have to give a dict of clean values when the columns have different data types.
clean_values = {
    'numeric_col': 0,
    'text_col': 'Missing',
    'date_col': pd.Timestamp('1970-01-01')
}
df.fillna(value=clean_values, inplace=True)
```

> To change multiple columns & fill with calculated values.

```python
df["column1", "column3"].fillna(["column"].mean(), inplace=True)
df["salary"].fillna(df["salary"].mean(), inplace=True)
# WRONG METHOD
# These two methods are outdated after 3.0 release of pandas and these will not work any more.
```

```python
# When we call fillna() in a sub-data-set pandas create a temp copy and modifies it so it does not reflect in the original data.
# CORRECT METHOD
means = df[["age", "salary"]].mean()
df[["age", "salary"]] = df[["age", "salary"]].fillna(means)
# OR
df["salary"] = df["salary"].fillna(df["salary"].mean())
```

#### INTERPOLATION

> Interpolation is mathematical data science technique to estimate missing values based on surrounding data & data trends.

```python
df["value"] = df["value"].interpolate(method="linear")
```

#### SORTING & AGGREGATION

> We can sort any dataset with respect to any particular column.

```python
df = df.sort_values(by="column", ascending=True)
# Inplace doesn't work here too.
```

> We can get aggregated values or the summary statistics with pandas/

```python
df["column"].mean()
df["column"].sum()
df["column"].min()
df["column"].max()
```

#### GROUPING

> We can group data and create summaries from them.

```python
grouped = df.groupby("column_to_group_by")["perform_operation_column"].sum()
# It will create a group by age then calculate sum of salary
grouped = df.groupby("age")["salary"].sum()
```

