import graph
import numpy as np


def get_number_verticies_edges(line, pos_num_vertex, pos_num_edges):
    param = line.split()
    try:
        return int(param[pos_num_vertex]), int(param[pos_num_edges])
    except TypeError:
        print(line)
    except ValueError:
        print(line)
    except IndexError:
        print(line)


def get_edge(line, pos_from_vertex, pos_to_vertex):
    param = line.split()
    try:
        return int(param[pos_from_vertex]) - 1, int(param[pos_to_vertex]) - 1
    except TypeError:
        print(line)
    except ValueError:
        print(line)
    except IndexError:
        print(line)


class Data:
    def __init__(self):
        pass



class DataDIMACS(Data):
    def __init__(self):
        pass

    @classmethod
    def load(cls, path):
        def is_start_char(line, c):
            return len(line) > 0 and line[0] == c

        def is_edge_line(line):
            return is_start_char(line, 'e')

        def is_number_vertices_edges_line(line):
            return is_start_char(line, 'p')

        with open(path) as file:
            cnt_vertices = None
            edges = None
            for line in file:
                if is_number_vertices_edges_line(line):
                    cnt_vertices, cnt_edges = get_number_verticies_edges(line, 2, 3)
                    edges = [[] for _ in range(cnt_vertices)]
                if is_edge_line(line):
                    v, to = get_edge(line, 1, 2)
                    if edges is None:
                        raise ValueError
                    edges[v].append(to)
                    edges[to].append(v)
        return graph.Graph(vertices = list(np.arange(0, cnt_vertices, 1)), adj=edges)


class DataFacebook(Data):
    def __init__(self):
        pass

    @classmethod
    def load(cls, path):
        with open(path) as file:
            cnt_vertices = None
            edges = None
            for i, line in enumerate(file):
                if i == 1:
                    cnt_vertices, cnt_edges = get_number_verticies_edges(line, 0, 2)
                    edges = [[] for _ in range(cnt_vertices)]
                if i > 1:
                    v, to = get_edge(line, 0, 1)
                    if edges is None:
                        raise ValueError
                    edges[v].append(to)
        return graph.Graph(vertices = list(np.arange(0, cnt_vertices, 1)), adj=edges)