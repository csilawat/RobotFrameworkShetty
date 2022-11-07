import csv
import string

#import Tools.scripts.mkreal
import pandas
import pandas as pd
from openpyxl import load_workbook
import os


# def read_csv_file(filename):
#     file = open(filename, 'r')
#     csvfile = csv.reader(file)
#     file.close
#     return [row for row in csvfile]

def read_csv_file(filename):
    data = []
    with open(filename, 'r') as csvfile:
        reader = csv.reader(csvfile)
        next(reader, None)
        for row in reader:
            data.append(row)
    return data
    end

def get_col_values(filename, col_name):
    return_list = []
    data = pd.read_csv(filename, usecols=[col_name])
    data_col = data[col_name]
    data_final = data[col_name].notnull()
    t = (data_col[data_final].to_string(index=False).split('\n'))
    for i in t:
        return_list.append(i.strip())
    return return_list


def Clear_file(filepath):
 with open(filepath, 'w+') as f:
     obj1=csv.writer(f)

def Append_file(filepath, data):
  with open(filepath, 'a') as f:
      obj1=csv.writer(f)
      obj1.write(data)

def update_field_with_value(file_name,field_name,data):
    df = pd.read_csv(file_name)
    df.at[0,field_name]=data
    df.to_csv(file_name,index=False)

def get_field_value(file_name,field_name):
    df = pd.read_csv(file_name)
    req_val = df[field_name].values[0]
    return req_val

def read_csv_file_header(fpath):
    with open(fpath, 'r') as infile:
        reader = csv.DictReader(infile)
        fieldnames = reader.fieldnames
        mystring = ','.join(fieldnames)
        substring_1 = "\t"
        substring_2 = " "
        if substring_1 in mystring:
            mylist= list(mystring.split("\t"))
            return mylist
        else:
            data = []
            for header in fieldnames:
                header = header.strip()
                data.append(header)
            return data

def get_col_values_of_excel_file(filename, sheet_name, col_name):
    mylist = []
    excel_data_df = pandas.read_excel(filename, sheet_name=sheet_name)
    mylist = excel_data_df[col_name].tolist()
    return mylist

def read_excel_file_header(filename, sheet_name):
    mylist = []
    excel_data_df = pandas.read_excel(filename, sheet_name=sheet_name)
    headers = excel_data_df.columns.ravel()
    mylist1 = headers.tolist()
    for elements in mylist1:
        elements = str(elements).strip()
        mylist.append(elements)
    return mylist

def update_cell_excel_file(filename, cell_id, new_value):
    workbook = load_workbook(filename=filename)
    sheet = workbook.active
    sheet[cell_id] =  new_value
    workbook.save(filename=filename)


def convert_excel_to_CSV(filename1, filename2):
    read_file = pd.read_excel(filename1)
    read_file.to_csv(filename2,index=None,header=True)
    df = pd.DataFrame(pd.read_csv(filename2))


# def read_excel_file_header(filename):
#     data = []
#     wb = xlrd.open_workbook(filename)
#     sheet = wb.sheet_by_index(0)
#     # For row 0 and column 0
#     sheet.cell_value(0, 0)
#     for i in range(sheet.ncols):
#         header = sheet.cell_value(0, i)
#         data.append(header)
#     return data
#     end


