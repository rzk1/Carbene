from ase.build import bulk, diamond111
from ase.io import write

GaN = bulk('NGa', 'wurtzite', a=9.7367653356401487/3.0, c=5.186)
Si = bulk('Si', 'diamond', a=5.43)
Si111 = diamond111('Si', (1,1,3), a=5.43, vacuum=20.0)
#GaN.cell
#Si111.edit()
write('GaN-443.xyz',GaN*(4,4,3),'xyz')
write('GaN-443.cif',GaN*(4,4,3),'cif')

