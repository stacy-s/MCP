import graph
import numpy as np


class Data:
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

        def get_number_verticies_edges(line):
            param = line.split()
            try:
                return int(param[2]), int(param[3])
            except TypeError:
                print(line)
            except ValueError:
                print(line)

        def get_edge(line):
            param = line.split()
            try:
                return int(param[1]) - 1, int(param[2]) - 1
            except TypeError:
                print(line)
            except ValueError:
                print(line)

        with open(path) as file:
            cnt_vertices = None
            edges = None
            for line in file:
                if is_number_vertices_edges_line(line):
                    cnt_vertices, cnt_edges = get_number_verticies_edges(line)
                    edges = [[] for _ in range(cnt_vertices)]
                if is_edge_line(line):
                    v, to = get_edge(line)
                    if edges is None:
                        raise ValueError
                    edges[v].append(to)
                    edges[to].append(v)
        return graph.Graph(vertices = list(np.arange(0, cnt_vertices, 1)), adj=edges)