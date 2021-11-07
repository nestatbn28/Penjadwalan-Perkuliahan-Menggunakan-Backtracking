from re import L
from csp import Constraint, CSP
from typing import Dict, List, NamedTuple, Optional, Tuple

import mysql.connector as mysql

db = mysql.connect(
    host = "localhost",
    user = "root",
    passwd = "",
    database="ta2",
)

cursor = db.cursor()



akun="select * from app_akun"
cursor.execute(akun)
akuns = cursor.fetchall()


dosen="select * from pmk"
cursor.execute(dosen)
dosens = cursor.fetchall()


hari="select * from app_hari"
cursor.execute(hari)
haris = cursor.fetchall()

kelas="select * from app_kelas"
cursor.execute(kelas)
kelass = cursor.fetchall()

matkul="select * from app_matkul"
cursor.execute(matkul)
matkuls = cursor.fetchall()


sesi="select * from app_sesi"
cursor.execute(sesi)
sesis = cursor.fetchall()


Grid = List[List[List[Tuple]]]

class GridSchedule(NamedTuple):
    row: int
    column: int
    akun: int

def generate_grid(rows: int, columns: int, akuns: int)->Grid:
       return [[[[] for j in range(akuns)] for i in range(rows)]for a in range(columns)]

def display_grid(grid: Grid)->None:
    for row in grid:
        print("".join(row))

 
   

def generate_domain(dms:Tuple,grid: Grid) -> List[List[List[GridSchedule]]]:
    domain: List[List[List[GridSchedule]]] = []
    height: int = len(grid)
    width: int = len(grid[0])
    akuns: int = len(grid[0][0])
    for col in range(height):
        for row in range(width):
            for akun in range(akuns):
                domain.append([GridSchedule(row,col,akun)])
    return domain


class GenerateConstraint(Constraint[Tuple, List[GridSchedule]]):
    def _init_(self, dms: List[Tuple]) -> None:
        super()._init_(dms)
        self.dms: List[Tuple] = dms

    def satisfied(self, assignment: Dict[Tuple, List[GridSchedule]]) -> bool:
        for dms,grid in assignment.items():   
            for dms1,grid1 in assignment.items():
                if dms==dms1:
                    break
                else:
                    if dms[0]==dms1[0] and grid[0][0:2]==grid1[0][0:2]:
                        return False
                    elif dms[1]==dms1[1] and grid[0][0:2]==grid1[0][0:2]:
                        return False
                    elif dms[1:3]==dms1[1:3] and grid[0][1]==grid1[0][1]:
                        return False  
                    elif dms[4]==1 and grid[0][2]==0 or dms1[4]==1 and grid1[0][2]==0:
                        return False
                    elif dms[4]==2 and grid[0][2]!=0 or dms1[4]==2 and grid1[0][2]!=0:
                        return False
                    elif dms[4]==1 or dms1[4]==1:
                        if grid[0][0:2]==grid1[0][0:2] and grid[0][2]==grid1[0][2]:
                            return False
        return True
 

if __name__ == "__main__":
    jumlah_sesi = len(sesis)
    jumlah_hari = len(haris)
    jumlah_akun =len(akuns)
    grid: Grid=generate_grid( jumlah_sesi, jumlah_hari, jumlah_akun)
    dms : List[Tuple] =  [row for row in dosens]

    location: Dict[Tuple, List[List[List[GridSchedule]]]] = {}
    for items in dms:
        location[items]= generate_domain(items,grid)

    csp: CSP[Tuple, List[GridSchedule]] = CSP(dms, location)
    csp.add_constraint(GenerateConstraint(dms))
    

    solution: Optional[Dict[Tuple, List[GridSchedule]]] = csp.backtracking_search()
    if solution is None:
        print("No solution found!")
    else: 
        truncate="TRUNCATE TABLE app_jadwal"
        cursor.execute(truncate)
        for dms, grid_locations in solution.items():
                insert="INSERT INTO app_jadwal(no_Akun_id,no_Hari_id,no_Kelas_id,no_Matkul_id,no_Pengajar_id,no_Sesi_id) VALUES(%s,%s,%s,%s,%s,%s)"
                val = (( grid_locations[0][2]+1),( grid_locations[0][1]+1),dms[1],dms[5],dms[0],(grid_locations[0][0]+1))
                cursor.execute(insert,val)
                db.commit()