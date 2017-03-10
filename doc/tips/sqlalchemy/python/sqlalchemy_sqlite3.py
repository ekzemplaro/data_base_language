#! /usr/bin/python
#-*- coding: utf-8 -*-
#
#	sqlalchemy_sqlite3.py
#
#					Mar/09/2017
#
# ------------------------------------------------------------------
from sqlalchemy import *
from sqlalchemy.orm import *
from sqlalchemy.ext.declarative import declarative_base
import sys
import datetime

# ------------------------------------------------------------------
sys.stderr.write ("*** 開始 ***\n")

metadata = MetaData()

engine = create_engine('sqlite:////var/tmp/sqlite3/cities.db')

db_session = scoped_session(sessionmaker(autocommit=False,
                                         autoflush=False,
                                         bind=engine))
Base = declarative_base()
Base.query = db_session.query_property()

#テーブルクラス
class City (Base):
    __tablename__ = 'cities'
    id = Column('id', String (64), primary_key=True)
    name = Column('name', String(64))
    population = Column('population', Integer)
    date_mod = Column('date_mod', String(64))
    
    def __init__(self, id, name, population, date_mod):
        self.id = id
        self.name = name
        self.population = population
        self.date_mod = date_mod

    def __repr__(self):
        return 'City'

cur = db_session.query (City).all()

for unit in cur:
	str_out = unit.id + "\t" + unit.name + "\t"
	str_out += str (unit.population) + "\t" + str(unit.date_mod)
	print (str_out)
#
sys.stderr.write ("*** 終了 ***\n")
# ------------------------------------------------------------------
