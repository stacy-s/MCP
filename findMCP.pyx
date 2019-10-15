cimport graph
import random

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
        self.current_clique = None
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


cdef class TrustCLQ:
    def __init__(self, graph.Graph g, double scale):
        self.max_clique = None
        self.init_graph = graph.Graph(vertices=g.vertices, adj=g.adj)
        self.scale = scale
        self.current_graph = graph.GraphTrustCLQ(vertices=self.init_graph.vertices, adj=self.init_graph.adj,
                                                 scale=self.scale)
        self.candidates = None
        self.current_clique = None

    cdef void update_candidates(self, int u):
        new_candidates = []
        for v in self.candidates:
            if self.current_graph.adj[u].count(v) > 0:
                new_candidates.append(v)
        self.candidates = new_candidates.copy()

    cdef double lost_trust(self, int v, int lower_bound):
        return float(lower_bound * 1.0) / (len(self.current_graph.adj[v]) + 1)

    cdef list find_clique(self, int lower_bound):
        self.current_graph.init_trust(lower_bound=lower_bound)
        have_positives = True
        while have_positives:
            have_positives = False
            for v in self.current_graph.vertices:
                if self.current_graph.trust[v] > 0:
                        # and self.current_graph.vertices.count(v) > 0:
                    have_positives = True
                    self.candidates = self.current_graph.adj[v].copy()
                    self.current_clique = [v]
                    while True:
                        if len(self.candidates) <= 0 or len(self.candidates) + len(self.current_clique) < lower_bound:
                            break
                        u = self.candidates[random.randint(0, len(self.candidates) - 1)]
                        self.current_clique.append(u)
                        self.update_candidates(u)
                    if len(self.current_clique) >= lower_bound:
                        return
                    if len(self.current_graph.adj[v]) + 1 == lower_bound:
                        self.current_graph.trust[v] = 0
                        self.current_graph.reduce_vertex(int(v))
                    else:
                        self.current_graph.trust[v] -= self.lost_trust(v=v, lower_bound=lower_bound)
                        if self.current_graph.trust[v] <= 0:
                            self.current_graph.reduce_vertex(v)
        self.current_clique = []

    cpdef graph.GraphMCP find_max_clique(self):
        random.seed(1573)
        # random.seed(0)
        self.max_clique = []
        i = 0
        while i < self.current_graph.cnt_vertices:
            for v in self.current_graph.vertices:
                if len(self.current_graph.adj[v]) + 1 < i:
                    self.current_graph.reduce_vertex(int(v))
            self.find_clique(lower_bound=len(self.max_clique) + 1)
            if len(self.max_clique) < len(self.current_clique):
                self.max_clique = self.current_clique.copy()
                i = len(self.max_clique) + 1
            else:
                i = i + 1
        return graph.GraphMCP(vertices=self.init_graph.vertices, adj=self.init_graph.adj, max_clique=self.max_clique)








