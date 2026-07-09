import uuid
import csv
import random

departments = [
    "Computer Science",
    "Data Science",
    "Electronics",
    "Mechanical"
]

names = [
    "Arun",
    "Varun",
    "Rahul",
    "Priya",
    "Ananya",
    "Kiran",
    "Sneha",
    "Ravi",
    "Asha",
    "Vikram"
]

with open("students.csv", "w", newline="") as file:
    writer = csv.writer(file)

    writer.writerow([
        "student_id",
        "name",
        "department",
        "year",
        "marks"
    ])

    for i in range(10):
        writer.writerow([
            uuid.uuid4(),
            random.choice(names),
            random.choice(departments),
            random.randint(1, 4),
            round(random.uniform(50, 100), 2)
        ])

print("students.csv generated successfully!")
