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
        self.vertices = vertices
        self.cnt_vertices = len(vertices)
        self.adj = adj

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
        self.max_clique = max_clique

cdef class GraphTrustCLQ(Graph):
    def __init__(self, list vertices, list adj, double scale, list max_clique=None):
        """
        graph initialization
        :param cnt_vertex: number of vertices in a graph
        :param adj: graph adjacency list
        :param max_clique: vertices belonging to maximum clique
        """
        super().__init__(vertices, adj)
        self.trust = {v:self.scale for v in range(self.cnt_vertices)}
        self.scale = scale

    cdef void init_trust(self, int lower_bound):
        self.trust = {v:self.scale for v in range(self.cnt_vertices) if len(self.adj[v]) + 1 >= lower_bound}

    cdef void reduce_vertex(self, int v):
        self.cnt_vertices -= 1
        try:
            self.vertices.remove(v)
        except ValueError:
            print(v)
        self.adj[v] = []
        for u in self.vertices:
            if self.adj[u].count(v) != 0:
                self.adj[u].remove(v)

