import graph
import data
import time
import pandas as pd
from os import walk
import logging
import networkx as nx
from networkx.algorithms.approximation import clique


formatter = logging.Formatter('%(asctime)s [%(levelname)s]%(module)s:%(lineno)s:%(message)s',
                                  datefmt='%m/%d/%Y %H:%M:%S'   )
fh = logging.FileHandler('log.log')
fh.setFormatter(formatter)
logging.getLogger().addHandler(fh)
logging.getLogger().setLevel(logging.INFO)

logger = logging.getLogger('clique.main')
logger.setLevel('INFO')

result = {"name": [], "num_vertices": [], "time": [],
              "max_clique": [], "size_max_clique": [], "is_right":[], "wrong_vertices":[]}


def get_all_files_in_path(path):
    files= []
    for (dirpath, dirnames, filenames) in walk(path):
        files.extend(filenames)
    return files


def save_result_for_1_file(filename):
    logger.debug('start save')
    g = data.DataDIMACS.load(filename)
    for key in result.keys():
        result[key].append(None)
    result["name"][-1] = filename
    result["num_vertices"][-1] = len(g.vertices)
    g_nx = g.to_nx_graph()
    start_time = time.time()
    max_clique = list(clique.max_clique(g_nx))
    finish_time = time.time()
    res = graph.NxMCP(g_nx, max_clique)
    ans = res.is_right_max_clique()
    is_right, not_neighbor = ans[0], ans[1]
    result["time"][-1] = finish_time - start_time
    result["is_right"][-1] = is_right
    result["max_clique"][-1] = res.max_clique
    result["size_max_clique"][-1] = len(res.max_clique)
    result["wrong_vertices"][-1] = not_neighbor
    df = pd.DataFrame.from_dict(result)
    df.to_csv('DIMACS_all_nx.csv', sep=';')
    logger.info(f'{filename} time-{finish_time - start_time}')


def save_result_data_type(path_folder):
    files = get_all_files_in_path(path_folder)
    files.sort()
    print(files)
    for filename in files:
        try:
            save_result_for_1_file(path_folder + '/' + filename)
        except TimeoutError:
            print(filename)
            result["name"][-1] = filename
        except ValueError:
            print(filename)
        except MemoryError:
            print(filename)


def main():
    save_result_data_type(path_folder="../DIMACS_all")


if __name__ == '__main__':
    main()