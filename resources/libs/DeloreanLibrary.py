import psycopg2
from logging import info

class DeloreanLibrary():

    def connect(self):
        return psycopg2.connect(
            host='ec2-50-17-255-244.compute-1.amazonaws.com',
            database='d2bgpb51k6389d',
            user='uwszwbeujobnxx',
            password='654001cd858dd1c5a328975d015f6dccc988433d61186d84209f4ea738b662a7'
        )

    # No Robot vira um KW autómaticamente => Remove Student  email@desejado.com
    def remove_student(self, email):

      query = "delete from students where email = '{}'".format(email)
      
      info(query)

      coon = self.connect()

      cur = coon.cursor()
      cur.execute(query)
      coon.commit()
      coon.close()

    def remove_student_by_name(self, name):

      query = "delete from students where name LIKE '%{}%'".format(name)
      
      info(query)

      coon = self.connect()

      cur = coon.cursor()
      cur.execute(query)
      coon.commit()
      coon.close()

    def insert_student(self, student):

        self.remove_student(student['email'])
        
        query = ("insert into students(name, email, age, weight, feet_tall, created_at, updated_at)"
                "values('{}','{}', {}, {}, {}, now(), now());"
                .format(student['name'], student['email'], student['age'], student['weight'], student['feet_tall']))
        
        info(query)

        coon = self.connect()

        cur = coon.cursor()
        cur.execute(query)
        coon.commit()
        coon.close()
      
    def remove_plan(self, title):
                
        query = "delete from plans where title LIKE '%{}%'".format(title)
        info(query)

        conn = self.connect()
        cur = conn.cursor()
        cur.execute(query)
        conn.commit()
        conn.close()

    def insert_plan(self, plan):

        self.remove_plan(plan['title'])

        query = ("insert into plans (title, duration, price, created_at, updated_at)"
                "values ('{}', '{}', {}, now(), now());"
                .format(plan['title'], plan['duration'], plan['price']))
        info(query)

        conn = self.connect()
        cur = conn.cursor()
        cur.execute(query)
        conn.commit()
        conn.close()
