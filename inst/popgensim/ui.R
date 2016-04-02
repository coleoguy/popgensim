# This interface is modified from the evobiR package
# http://coleoguy.github.io/software.html

shinyUI(fluidPage(
  titlePanel("", "Change in Allele or Genotype Frequency"),
  fluidRow(
    column(4,

           fluidRow(
             column(6,

                    span(style="color:darkgreen", h3("Plot Basics")),
                    sliderInput("initial.A", "Initial frequency of A:",
                                min = 0, max = 1, value=0.5, step =0.01),
                    sliderInput("gen", "Generations:",
                                min = 10, max = 1000, value = 100, step = 10),
                    span(style="color:darkgreen", h3("Selection")),
                    sliderInput("fit.AA", "Fitness of AA:",
                                min = 0, max = 1.5, value = 1, step = 0.05),
                    sliderInput("fit.Aa", "Fitness of Aa:",
                                min = 0, max = 1.5, value = 1, step = 0.05),
                    sliderInput("fit.aa", "Fitness of aa:",
                                min = 0, max = 1.5, value = 1, step = 0.05)

             ),

             column(6,
                    span(style="color:darkgreen", h3("Drift")),
                    sliderInput("pop", "Population Size:",
                                min = 10, max = 1000, value = 100, step = 10, animate = T),
                    sliderInput("iter", "Replicates:",
                                min = 0, max = 50, value = 0, step = 1),
                    # TODO: option for starting with a single copy of A1
                    span(style="color:darkgreen", h3("Mutation")),
                    sliderInput("qAa", "Rate from A to a:",
                                min = 0, max = 0.1, value = 0, step = 0.001),
                    sliderInput("qaA", "Rate from a to A:",
                                min = 0, max = 0.1, value = 0, step = 0.001),
                    selectInput("var.plot", "What to plot:",
                                list("A" = 4,
                                     "a" = 5,
                                     "AA" = 1,
                                     "Aa"  = 2,
                                     "aa"  = 3)),
                    h5(strong("Re-run simulations:")),
                    actionButton("seed.val", 'Refresh')
             )
           )
    ),

    column(8,
           plotOutput("genePlot", width='100%', height='600px')
    )
  )
))
