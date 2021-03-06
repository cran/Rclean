#' .get.spine --- Find the minimal path through the provenance necessary to 
#' produce a result.
#'
#' OUTPUT = A vector with the set of nodes of the minimal path.
#' 
#' This is an internal function for parsing PROV-JSON formatted 
#' provenance.
#' 
#' @param node.id Name of the node.
#' @param g Provenance graph adjacency matrix.
#' @return A set of node names tracing the complete parantage of a result.
#' @author Matthew K. Lau
#' @importFrom igraph dfs
#' @importFrom igraph graph_from_adjacency_matrix
#' @importFrom stats na.omit
#'@examples
#' data(prov_json)
#' prov <- read.prov(prov_json)
#' Rclean:::get.spine("d1", prov$graph)

get.spine <- function(node.id, g){
    ig <- graph_from_adjacency_matrix(g)
    as.character(na.omit(names(dfs(ig, node.id, "out" , unreachable = FALSE)$order)))
}
