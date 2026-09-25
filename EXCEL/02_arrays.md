## ARRAYS 

### 1. Comparison with array will return a full dynamic array.

```excel
=A2:A32673=$S$1
FALSE
FALSE
FALSE
FALSE
TRUE
FALSE
.
.
.
```

### 2. Multiplying `Booleans` works as `AND` because true/false are just 1/0 under the hood so if all the boolean are true then it will return `1/true` if one is false then it will return `0/false`.

```excel
=true*true*true
TRUE / 1
=true*true*false
FALSE / 0
```

### 3. Adding `Booleans` works as `OR` because any of the condition is true then it will evaluate it as 1 and adding it will lead to a integer number and any integer other than 0 is considered `true`.

```excel
=true+true+true
TRUE / 3
=true+true+false
TRUE / 2
=false+false
false / 0
```

### 4. We can make any formula into its `IF` version with it... like ...

```excel
=MEDIAN(IF(($A$2:$A$32=$Z2)*($M$2:$M$32<>""),$M$2:$M$32))
```

> ### BREAKDOWN :
>
> First we compare the array with conditions so it returns a array of 0/1 and if evaluates them and returns an array of the value with condition met. Then the `Median` calculation is done on that array.
> 
> ### Why we can't use `AND` / `OR` ... ?
> 
> `AND` / `OR` returns a aggregated result like true/false (just one) but this way we get the result in an array so that we can do calculation on that array.
> 

