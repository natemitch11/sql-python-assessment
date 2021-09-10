# this line is defining a variable called log_file and is storing a method that opens a specific file within the variable
log_file = open("um-server-01.txt")


# This line is defining a function called sales_reports and takes in 1 argument which is a variable in this case
def sales_reports(log_file):
    for line in log_file:  # This line is looping through each line in the log file, line could be called anything though
        line = line.rstrip()  # this line is defining the line variable we created for our loop and is stripping all characters off right side of each line and storing the contents inside of a list
        day = line[0:3]  # This line is defining a new variable called day and is storing the values of the line variable for this loop iteration at index 0 and taking the first 3 characters of index 0 and storing that inside of a list in the day variable
        if day == "Mon":  # this line is establishing conditional logic that is going to check and see what is stored inside of the day variable. if it equals the string then it will proceed
            print(line)  # This line is determining what will happen if the conditional logic above is met, it this case it will print out the information contained in the line variable for this loop iteration


# this line is calling the function and passing in the single argument variable
sales_reports(log_file)


def over_10_melons(log_file):
    for line in log_file:
        line = line.rstrip().split(' ')
        count = int(line[2])
        if count > 10:
            print(line)


over_10_melons(log_file)
