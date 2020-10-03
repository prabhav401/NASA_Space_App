import numpy as np

data = [["Madhhav", 110, 6],["Prabhu", 70, 5],["Jones", 80, 8]]

astro_data=[]

astro_data = np.array(data)

print(astro_data)

name = input("Please enter your name: ")

name_result = np.where(astro_data == name)

print(astro_data[name_result,:])