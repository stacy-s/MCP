cdef class Graph:
    """
    Class Graph
    """

    def __init__(self, int cnt_vertex, list adj):
        """
        graph initialization
        :param cnt_vertex: number of vertices in a graph
        :param adj: graph adjacency list
        """
        self.cnt_vertex = cnt_vertex
        self.adj = adj


cdef class GraphMCP(Graph):
    """
    Сlass contains graph with maximum click
    """

    def __init__(self, int cnt_vertex, list adj, list max_clique=None):
        """
        graph initialization
        :param cnt_vertex: number of vertices in a graph
        :param adj: graph adjacency list
        :param max_clique: vertices belonging to maximum clique
        """
        super().__init__(cnt_vertex, adj)
        self.max_clique = max_clique