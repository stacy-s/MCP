cimport graph

cpdef void print_graph():
    g = graph.GraphMCP(10, [3, 4, 5], [1, 2])
    print(g.cnt_vertex, g.adj, g.max_clique)


cdef class MCSWithHeuristic:
    def __init__(self):
        self.vertex = None
        self.num_vertices = 0
        self.adj = None
        self.adj_complementary = None
        self.adj_matrix = None
        self.candidates = None
        self.candidates_init = None
        self.candidates_init_copy = None
        self.current_cligue = None
        self.largest_clique = None
        self.vertices_every_color = None
        self.neighbors_among_candidates = None
        self.degrees = None
        self.degrees_of_neighbors = None

    cdef ILS(self):
        pass

    cdef heuristic_solution(self):
        self.largest_clique = self.ILS()

    cdef initial_ordering_and_coloring(self):
        self.degrees = [0 for _ in range(self.num_vertices)]
        self.degrees_of_neighbors = [0 for _ in range(self.num_vertices)]
        for v in range(self.num_vertices):
            self.degrees[v] = len(self.adj)
        for v in range(self.num_vertices):
            for to in self.adj[v]:
                self.degrees_of_neighbors[v] += self.degrees[to]
        pass

    cdef upper_bound(self, int v):
        pass

    cdef process_branch(self, int v):
        pass

    cdef mcs_with_heuristic(self):
        self.heuristic_solution()
        self.initial_ordering_and_coloring()
        for i in range(len(self.candidates_init) - 1, -1, -1):
            v = int(self.candidates_init[i])
            if self.upper_bound(int(v)) > len(self.largest_clique):
                self.process_branch(int(v))




