cdef class Graph:
    cdef public int cnt_vertex      #number of vertices in a graph
    cdef public list adj        #graph adjacency list


cdef class GraphMCP(Graph):
    cdef public max_clique      #vertices belonging to maximum clique
