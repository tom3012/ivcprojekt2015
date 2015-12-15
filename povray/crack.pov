// Riss

#declare Crack =
union{
  box{
    <-0.5, 0, -0.5>
    <0.5, 0.05, 0.5>
    pigment{ Black }
  }
  box{
    <-0.5, 0, -0.5>
    <0.5, 0.05, 0.5>
    rotate <5, 20, 0>
    pigment{ Black }
  }
  box{
    <-0.5, 0, -0.5>
    <0.5, 0.05, 0.5>
    rotate <0, 50, 5>
    pigment{ Black }
  }
  box{<-0.5, 0, -0.5>
    <0.5, 0.05, 0.5>
    rotate 85 * y
    pigment{ Black }
  }
}

