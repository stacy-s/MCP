from distutils.core import setup
from Cython.Build import cythonize

setup(ext_modules = cythonize('graph.pyx'))
setup(ext_modules = cythonize('findMCP.pyx'))