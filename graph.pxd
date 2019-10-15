import networkx as nx

cdef class Graph:
    cdef public int cnt_vertices     #number of vertices in a graph
    cdef public list vertices
    cdef public list adj        #graph adjacency list
    cpdef to_nx_graph(self)
    cpdef list reduce_vertex(self, int v)
    cpdef void expand(self, list vertices, list edges)
    cdef void recounting_cnt_vertices(self)


cdef class GraphMCP(Graph):
    cdef public max_clique      #vertices belonging to maximum clique

    cpdef list is_right_max_clique(self)


cdef class NxMCP(GraphMCP):
    pass


cdef class GraphTrustCLQ(Graph):
    cdef public double scale
    cdef public list trust

    cdef void init_trust(self, int lower_bound)
