# 2.1 Charts for one variable
# LOAD DATASETS PACKAGE
require("datasets") #Ejemplo
data(chickwts)
# "barplot" offers more control but must prepare data:
# R doesn't create bar charts directly from the categorical
# variables; instead, we must first create a table that
# has the frequencies for each level of the variable.
feeds <- table(chickwts$feed)