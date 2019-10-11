cimport graph

cdef class MCSWithHeuristic:
    cdef public list vertex
    cdef public int num_vertices
    cdef public list adj
    cdef public list adj_complementary
    cdef public list adj_matrix
    cdef public list candidates
    cdef public list candidates_init
    cdef public list candidates_init_copy
    cdef public list current_cligue
    cdef public list largest_clique
    cdef public list vertices_every_color
    cdef public list neighbors_among_candidates
    cdef public list degrees
    cdef public list degrees_of_neighbors

    cdef mcs_with_heuristic(self)
    cdef process_branch(self, int)
    cdef upper_bound(self, int)
    cdef initial_ordering_and_coloring(self)
    cdef heuristic_solution(self)
    cdef ILS(self)



cdef class TrustCLQ:
    cdef public list max_clique
    cdef public graph.Graph init_graph
    cdef public graph.GraphTrustCLQ current_graph
    cdef public double scale
    cdef public list candidates
    cdef public list current_clique

    cpdef graph.GraphMCP find_max_clique(self)
    cdef list find_clique(self, int lower_bound)
    cdef void update_candidates(self, int v)
    cdef double lost_trust(self, int v, int lower_bound)