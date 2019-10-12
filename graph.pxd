cdef class Graph:
    cdef public int cnt_vertices     #number of vertices in a graph
    cdef public list vertices
    cdef public list adj        #graph adjacency list


cdef class GraphMCP(Graph):
    cdef public max_clique      #vertices belonging to maximum clique

    cpdef bint is_right_max_clique(self)

cdef class GraphTrustCLQ(Graph):
    cdef public double scale
    cdef public list trust

    cpdef void reduce_vertex(self, int v)
    cdef void init_trust(self, int lower_bound)
