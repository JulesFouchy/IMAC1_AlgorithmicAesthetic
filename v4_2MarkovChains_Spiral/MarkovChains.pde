float[][] randomMarkov( int size , float probaDiag ){
  
  float[][] markov = new float[size][size] ;
  
  for( int i = 0 ; i < size ; ++i ){
    float[] probasCumul = new float[size] ;
    for( int k = 1 ; k < size-1 ; ++k ){
      probasCumul[k] = random(1-probaDiag) ;
    }
    probasCumul = sort(probasCumul) ;
    probasCumul[0] = probaDiag ;
    probasCumul[1] = 1-probaDiag - probasCumul[size-1] ;
    for( int k = size-1 ; k>2 ; --k ){
      probasCumul[k] -= probasCumul[k-1] ;
    }
    swap( probasCumul , i , 0 ) ;
    for( int j = 0 ; j < size ; ++j ){
      markov[i][j] = probasCumul[j] ;
    }
  }
  return markov ;
}

void swap( float[] tab , int k , int l ){
  float tmp = tab[k] ;
  tab[k] = tab[l] ;
  tab[l] = tmp ;
}
