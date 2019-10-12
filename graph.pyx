cdef class Graph:
    """
    Class Graph
    """

    def __init__(self, list vertices, list adj):
        """
        graph initialization
        :param cnt_vertex: number of vertices in a graph
        :param adj: graph adjacency list
        """
        self.vertices = vertices.copy()
        self.cnt_vertices = len(vertices)
        self.adj = [x.copy() for x in adj]

    def __copy__(self):
        return Graph(self.vertices, self.adj)






cdef class GraphMCP(Graph):
    """
    Сlass contains graph with maximum click
    """

    def __init__(self, list vertices, list adj, list max_clique=None):
        """
        graph initialization
        :param cnt_vertex: number of vertices in a graph
        :param adj: graph adjacency list
        :param max_clique: vertices belonging to maximum clique
        """
        super().__init__(vertices, adj)
        self.max_clique = max_clique.copy()

    cpdef bint is_right_max_clique(self):
        if self.max_clique is None:
            raise ValueError
        for i in range(len(self.max_clique)):
            for j in range(i + 1, len(self.max_clique)):
                if self.adj[self.max_clique[i]].count(self.max_clique[j]) == 0:
                    print(self.max_clique[i], self.max_clique[j])
                    # return False
        # return True

cdef class GraphTrustCLQ(Graph):
    def __init__(self, list vertices, list adj, double scale, list max_clique=None):
        """
        graph initialization
        :param cnt_vertex: number of vertices in a graph
        :param adj: graph adjacency list
        :param max_clique: vertices belonging to maximum clique
        """
        super().__init__(vertices, adj)
        self.trust = [self.scale for v in range(self.cnt_vertices)]
        self.scale = scale

    cdef void init_trust(self, int lower_bound):
        self.trust = [self.scale for v in range(self.cnt_vertices)]

    cpdef void reduce_vertex(self, int v):
        if self.vertices.count(v) == 0:
            return
        self.vertices.remove(v)
        self.adj[v] = []
        for u in self.vertices:
            if self.adj[u].count(v) != 0:
                self.adj[u].remove(v)



