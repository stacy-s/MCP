cimport graph


cdef class TrustCLQ:
    cdef public list max_clique
    cdef public graph.Graph init_graph
    cdef public graph.GraphTrustCLQ current_graph
    cdef public double scale
    cdef public list candidates
    cdef public list current_clique

    cpdef graph.GraphMCP find_max_clique(self)
    cdef list find_clique(self, int lower_bound)
    cdef void update_candidates(self, int u)
    cdef double lost_trust(self, int v, int lower_bound)