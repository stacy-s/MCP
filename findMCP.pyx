cimport graph

cpdef void print_graph():
    g = graph.GraphMCP(10, [3, 4, 5], [1, 2])
    print(g.cnt_vertex, g.adj, g.max_clique)