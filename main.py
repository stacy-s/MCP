import graph
import findMCP
import data
import time
import pandas as pd
from os import walk
import click
import logging


formatter = logging.Formatter('%(asctime)s [%(levelname)s]%(module)s:%(lineno)s:%(message)s',
                                  datefmt='%m/%d/%Y %H:%M:%S'   )
fh = logging.FileHandler('log.log')
fh.setFormatter(formatter)
logging.getLogger().addHandler(fh)
logging.getLogger().setLevel(logging.INFO)

logger = logging.getLogger('clique.main')
logger.setLevel('INFO')

result = {"name": [], "num_vertices": [], "time": [],
              "scale":[], "max_clique": [], "size_max_clique": [], "is_right":[], "wrong_vertices":[]}


def get_all_files_in_path(path):
    files= []
    for (dirpath, dirnames, filenames) in walk(path):
        files.extend(filenames)
    return files


def save_result_for_1_file(filename, scale):
    logger.debug('start save')
    g = data.DataFacebook.load(filename)
    for key in result.keys():
        result[key].append(None)
    logger.info(f'{filename} scale-{scale}')
    result["name"][-1] = filename
    result["num_vertices"][-1] = len(g.vertices)
    result["scale"][-1] = scale
    c = findMCP.TrustCLQ(g=g, scale=scale)
    start_time = time.time()
    res = c.find_max_clique()
    finish_time = time.time()
    ans = res.is_right_max_clique()
    is_right, not_neighbor = ans[0], ans[1]
    result["time"][-1] = finish_time - start_time
    result["is_right"][-1] = is_right
    result["max_clique"][-1] = res.max_clique
    result["size_max_clique"][-1] = len(res.max_clique)
    result["wrong_vertices"][-1] = not_neighbor
    df = pd.DataFrame.from_dict(result)
    df.to_csv('facebook.csv', sep=';')
    logger.info(f'{filename} time-{finish_time - start_time} scale-{scale}')


def save_result_data_type(path_folder, scale):
    files = get_all_files_in_path(path_folder)
    files.sort()
    print(files)
    for filename in files:
        try:
            save_result_for_1_file(path_folder + '/' + filename, scale)
        except TimeoutError:
            print(filename)
            result["name"][-1] = filename
            result["scale"][-1] = scale
        except ValueError:
            print(filename)
        except MemoryError:
            print(filename)


@click.command()
@click.option('--scale', default=0.1, help='scale value')
def main(scale):
    save_result_data_type(path_folder="../facebook15", scale=scale)


if __name__ == '__main__':
    main()