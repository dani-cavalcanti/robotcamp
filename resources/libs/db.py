import psycopg2

def execute_q(query):
    conn = psycopg2.connect(
        host = 'zepalheta-postgres',
        database ='zepalheta',
        user= 'postgres',
        password = 'qaninja'
    )

    cur = conn.cursor()

    cur.execute(query)

    conn.commit()

    cur.close()
    conn.close()

def format_cpf(cpf):
    return cpf[:3] + "." + cpf[3:6] + "." + cpf[6:9] + "-" + cpf[9:]

def insert_customer(name, cpf, address, phone):
    
    cpf_formatado = format_cpf(cpf)

    query = "insert into public.customers(name,cpf,address,phone_number) "\
	    "values ('{}', '{}', '{}', '{}');".format(name, cpf_formatado, address, phone)
    print(query)

    execute_q(query)


def remove_customer_by_cpf(cpf):

    cpf_formatado = format_cpf(cpf)

    query = "DELETE from public.customers where cpf = '{}';".format(cpf_formatado)
    print(query)

    execute_q(query)

def remove_equipo_by_name(eq_name):
    query = "delete from public.equipos where name ='{}';".format(eq_name)
    print(query)

    execute_q(query)

def insert_equipo(eq_name, eq_price):
    query = "insert into public.equipos(name, daily_price) "\
        "values ('{}', {});".format(eq_name, eq_price.replace(",","."))
    print(query)

    execute_q(query)
