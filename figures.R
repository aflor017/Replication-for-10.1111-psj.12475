## visuals
library(tidyverse)
library(readxl)
results <- read_excel("C:/Users/aflor/OneDrive - american.edu/ENDA Research/Trans Attitudes/Trans Exp 7/results.xlsx")

results$cond[results$cond=="Only Read and Perspective Take"] <- "Read and Perspective Take"

results <- results %>%
  mutate(out_text = case_when(outcome==1 ~ "Birth Sex",
                              outcome==2 ~ "Current Gender",
                              outcome==3 ~ "Refused"),
         cond_fac = factor(cond, levels = c("View","Read","Perspective Take", "Only View", "View and Perspective Take", "Only Read", "Read and Perspective Take")),
         out_text_fac = factor(out_text, levels = c("Refused", "Current Gender", "Birth Sex")))

p <- ggplot(subset(results, cond=="View" | cond == "Read" | cond == "Perspective Take"), aes(x=out_text, y = est, ymin = lb, ymax = ub))

p1 <- p + geom_pointrange(size = 0.8) +
  geom_text(aes(label = paste(round(est,2)," (", round(se,2),")")), size = 2, vjust=2) +
  geom_hline(yintercept = 0, color="red", linetype = "dashed") +
  ggthemes::theme_clean() +
  coord_flip() +
  facet_wrap(~cond_fac) +
  labs(y = "Treatment Effect",
       x = NULL)

p <- ggplot(subset(results, cond=="Only View" | cond =="View and Perspective Take" | cond == "Only Read" | cond == "Read and Perspective Take"), aes(x=out_text, y = est, ymin = lb, ymax = ub))

p2 <- p + geom_pointrange(size = 0.8) +
  geom_text(aes(label = paste(round(est,2)," (", round(se,2),")")), size = 2, vjust=2) +
  geom_hline(yintercept = 0, color="red", linetype = "dashed") +
  ggthemes::theme_clean() +
  coord_flip() +
  facet_wrap(~cond_fac) +
  labs(y = "Treatment Effect",
       x = NULL)

library(cowplot)
plot_grid(p1,p2)

ggsave("C:/Users/aflor/Downloads/expfig1.tiff", device="tiff")


## Q40
results <- read_excel("C:/Users/aflor/OneDrive - american.edu/ENDA Research/Trans Attitudes/Trans Exp 7/results.xlsx", sheet = "Q40" )

results <- results %>%
  mutate(dv = case_when(cat=="Q40_1" ~ "Security Risk to Women & Children",
                        cat=="Q40_2" ~ "Discriminates Against\nTransgender People",
                        cat=="Q40_3" ~ "Disgusted to Use a Bathroom\nwith Transgender People",
                        cat == "Q40_4" ~ "Safety of Transgender\nPeople Is At-Risk"),
         cond_fac = factor(cond, levels = c("View","Read","Perspective Take", "Only View", "View and Perspective Take", "Only Read", "Read and Perspective Take")),
         dv_fac = factor(dv, levels = c("Security Risk to Women & Children", "Disgusted to Use a Bathroom\nwith Transgender People", "Safety of Transgender\nPeople Is At-Risk", "Discriminates Against\nTransgender People")))

p <- ggplot(subset(results, cond=="View" | cond == "Read" | cond == "Perspective Take"), aes(x=dv_fac, y = est, ymin = lb, ymax = ub))

p1 <- p + geom_pointrange(size = 0.8) +
  geom_text(aes(label = paste(round(est,2)," (", round(se,2),")")), size = 2, vjust=2) +
  geom_hline(yintercept = 0, color="red", linetype = "dashed") +
  ggthemes::theme_clean() +
  theme(axis.text = element_text(size=8), strip.text = element_text(size=8)) +
  scale_y_continuous(labels = scales::number_format(accuracy=.1)) +
  coord_flip() +
  facet_wrap(~cond_fac) +
  labs(y = "Treatment Effect",
       x = NULL)

p <- ggplot(subset(results, cond=="Only View" | cond =="View and Perspective Take" | cond == "Only Read" | cond == "Read and Perspective Take"), aes(x=dv_fac, y = est, ymin = lb, ymax = ub))

p2 <- p + geom_pointrange(size = 0.8) +
  geom_text(aes(label = paste(round(est,2)," (", round(se,2),")")), size = 2, vjust=2) +
  geom_hline(yintercept = 0, color="red", linetype = "dashed") +
  ggthemes::theme_clean() +
  theme(axis.text = element_text(size=8), strip.text = element_text(size=8)) +
  coord_flip() +
  facet_wrap(~cond_fac) +
  labs(y = "Treatment Effect",
       x = NULL)

plot_grid(p1,p2)
ggsave("C:/Users/aflor/Downloads/expfig2.tiff", device="tiff")

## transportability mechanism
results <- read_excel("C:/Users/aflor/OneDrive - american.edu/ENDA Research/Trans Attitudes/Trans Exp 7/results.xlsx", sheet = "Transp" )

results <- results %>%
  mutate(cond_fac = factor(cond, levels = c("View","Read")),
         dv_s = case_when(dv=="Bathrooms Based on Birth Gender" ~ "Bathrooms Based\non Birth Gender",
                          dv=="Discriminates Against Transgender People" ~ "Discriminates Against\nTransgender People",
                          dv=="Safety of Transgender People Is at Risk" ~ "Safety of Transgender\nPeople Is at Risk"),
         dv_fac = factor(dv_s, levels = c("Bathrooms Based\non Birth Gender", "Discriminates Against\nTransgender People", "Safety of Transgender\nPeople Is at Risk"))
)

p <- ggplot(results, aes(x = transportation, y = est, ymin = lb, ymax = ub, color = cond_fac, fill = cond_fac, linetype=cond_fac))

p + geom_ribbon(aes(color=NULL), alpha=.4) +
  geom_line(size = 1) +
  ggthemes::theme_clean() +
  theme(legend.position = "bottom", legend.background = element_blank()) +
  scale_color_brewer(type = "qual", palette = 2) +
  scale_fill_brewer(type = "qual", palette = 2) +
  labs(x = "Transportation",
       y = NULL,
       color = NULL,
       fill = NULL,
       linetype=NULL) +
  facet_wrap(~dv_fac, scales = "free")

ggsave("C:/Users/aflor/Downloads/expfig3.tiff", device="tiff")

## absorb moderation
results <- read_excel("C:/Users/aflor/OneDrive - american.edu/ENDA Research/Trans Attitudes/Trans Exp 7/results.xlsx", sheet = "Absorb" )

results <- results %>%
  mutate(cond_fac = factor(cond_1, levels = c("View", "Read")),
         dv_s = case_when(dv=="Bathrooms Based on Birth Gender" ~ "Bathrooms Based\non Birth Gender",
                          dv=="Discriminates Against Transgender People" ~ "Discriminates Against\nTransgender People",
                          dv=="Safety of Transgender People Is at Risk" ~ "Safety of Transgender\nPeople Is at Risk"),
         dv_fac = factor(dv_s, levels = c("Bathrooms Based\non Birth Gender", "Discriminates Against\nTransgender People", "Safety of Transgender\nPeople Is at Risk")),
         cond2_rec = case_when(cond_2=="Did Not Perspective Take" ~ "Did Not\nPerspective\nTake",
                               cond_2=="Perspective Take" ~ "Perspective\nTake")
  )

range_item <- range(range(results$lb[results$dv=="Bathrooms Based on Birth Gender"]), range(results$Absorption))

dummy <- data.frame(Absorption = c(1,5), est = c(-0.285, 0.22),
                    lb = c(-0.47, 0.02), ub = c(-0.13, 0.42),
                    dv_fac = "Bathrooms Based\non Birth Gender")
dummy$dv_fac <- factor(dummy$dv_fac)

p <- ggplot(results, aes(x = Absorption, y = est, ymin = lb, ymax = ub))
p + facet_grid(cond_fac + cond2_rec ~ dv_fac, scales="free") 

p +   facet_wrap(cond_fac + cond2_rec ~ dv_fac, scales="free", nrow = 4, ncol = 3, strip.position = "right", labeller = labeller(cond_fac = label_value, 
                                                                                                                                                cond2_rec = label_value, 
                                                                                                                                                dv_fac = label_value, multi_line = FALSE)) + 
  geom_hline(yintercept=0, color ="red", size = 0.5, linetype="dashed") +
  geom_ribbon(aes(color=NULL), alpha=.4) +
  geom_line(size = 1) +
  geom_blank(data = dummy)  +
  ggthemes::theme_clean() + 
  theme(strip.text.y = element_blank(), strip.background = element_blank(), strip.placement = "outside",
        axis.text.y = element_text(size = 6)) +
  labs(y = "Treatment Effect")

ggsave("C:/Users/aflor/Downloads/expfig4.tiff", device="tiff")

## BOUNDS Appendix
results <- read_excel("C:/Users/aflor/OneDrive - american.edu/ENDA Research/Trans Attitudes/Trans Exp 7/results.xlsx", sheet = "Bounds_Q40" )

results <- results %>%
  mutate(dv = case_when(cat=="Q40_1" ~ "Security Risk to Women & Children",
                        cat=="Q40_2" ~ "Discriminates Against\nTransgender People",
                        cat=="Q40_3" ~ "Disgusted to Use a Bathroom\nwith Transgender People",
                        cat == "Q40_4" ~ "Safety of Transgender\nPeople Is At-Risk"),
         cond_fac = factor(cond, levels = c("View","Read","Perspective Take", "Only View", "View and Perspective Take", "Only Read", "Read and Perspective Take")),
         dv_fac = factor(dv, levels = c("Safety of Transgender\nPeople Is At-Risk", "Discriminates Against\nTransgender People")))

p <- ggplot(subset(results, type=="margin" & (cond=="View" | cond == "Read" | cond == "Perspective Take")), aes(x=dv_fac, y = est, ymin = lb, ymax = ub))

p1 <- p + geom_pointrange(size = 0.6) +
  geom_errorbar(data = subset(results, type!="margin" & (cond=="View" | cond == "Read" | cond == "Perspective Take")), aes(ymin=lb,ymax=ub, color=type), position = position_dodge(width=0.5), size=1, width=0.2) +
  geom_hline(yintercept = 0, color="red", linetype = "dashed") +
  ggthemes::theme_clean() +
  theme(axis.text = element_text(size=8), strip.text = element_text(size=8), legend.position = "top", legend.background = element_blank()) +
  guides(color = guide_legend(nrow=2)) +
  scale_y_continuous(labels = scales::number_format(accuracy=.1)) +
  scale_color_discrete(labels=c("Bounds", "90% CI of upper", "90% CI of lower")) +
  coord_flip() +
  facet_wrap(~cond_fac) +
  labs(y = "Treatment Effect",
       x = NULL,
       color=NULL)

p <- ggplot(subset(results, type=="margin" & (cond=="Only View" | cond =="View and Perspective Take" | cond == "Only Read" | cond == "Read and Perspective Take")), aes(x=dv_fac, y = est, ymin = lb, ymax = ub))

p2 <- p + geom_pointrange(size = 0.8) +
  geom_errorbar(data = subset(results, type!="margin" & (cond=="Only View" | cond =="View and Perspective Take" | cond == "Only Read" | cond == "Read and Perspective Take")), aes(ymin=lb,ymax=ub, color=type), position = position_dodge(width=0.5), size=1, width=0.3) +
  geom_hline(yintercept = 0, color="red", linetype = "dashed") +
  ggthemes::theme_clean() +
  theme(axis.text = element_text(size=8), strip.text = element_text(size=8), legend.position = "top", legend.background = element_blank()) +
  guides(color = guide_legend(nrow=2)) +
  scale_color_discrete(labels=c("Bounds", "90% CI of upper", "90% CI of lower")) +
  coord_flip() +
  facet_wrap(~cond_fac) +
  labs(y = "Treatment Effect",
       x = NULL,
       color = NULL)

plot_grid(p1, p2)
ggsave("C:/Users/aflor/Downloads/expfigs1.tiff", device="tiff")

## Q39
results <- read_excel("C:/Users/aflor/OneDrive - american.edu/ENDA Research/Trans Attitudes/Trans Exp 7/results.xlsx", sheet = "Bounds_Q39" )

results <- results %>%
  mutate(dv = "Bathrooms Based\non Birth Sex",
           cond_fac = factor(cond, levels = c("View","Read","Perspective Take", "Only View", "View and Perspective Take", "Only Read", "Read and Perspective Take")),
         )

p <- ggplot(subset(results, type=="margin" & (cond=="View" | cond == "Read" | cond == "Perspective Take")), aes(x=dv, y = est, ymin = lb, ymax = ub))

p1 <- p + geom_pointrange(size = 0.6) +
  geom_errorbar(data = subset(results, type!="margin" & (cond=="View" | cond == "Read" | cond == "Perspective Take")), aes(ymin=lb,ymax=ub, color=type), position = position_dodge(width=0.5), size=1, width=0.2) +
  geom_hline(yintercept = 0, color="red", linetype = "dashed") +
  ggthemes::theme_clean() +
  theme(axis.text = element_text(size=8), strip.text = element_text(size=8), legend.position = "top", legend.background = element_blank()) +
  guides(color = guide_legend(nrow=2)) +
  scale_y_continuous(labels = scales::number_format(accuracy=.1)) +
  scale_color_discrete(labels=c("Bounds", "90% CI of upper", "90% CI of lower")) +
  coord_flip() +
  facet_wrap(~cond_fac) +
  labs(y = "Treatment Effect",
       x = NULL,
       color=NULL)

p <- ggplot(subset(results, type=="margin" & (cond=="Only View" | cond =="View and Perspective Take" | cond == "Only Read" | cond == "Read and Perspective Take")), aes(x=dv, y = est, ymin = lb, ymax = ub))

p2 <- p + geom_pointrange(size = 0.8) +
  geom_errorbar(data = subset(results, type!="margin" & (cond=="Only View" | cond =="View and Perspective Take" | cond == "Only Read" | cond == "Read and Perspective Take")), aes(ymin=lb,ymax=ub, color=type), position = position_dodge(width=0.5), size=1, width=0.3) +
  geom_hline(yintercept = 0, color="red", linetype = "dashed") +
  ggthemes::theme_clean() +
  theme(axis.text = element_text(size=8), strip.text = element_text(size=8), legend.position = "top", legend.background = element_blank()) +
  guides(color = guide_legend(nrow=2)) +
  scale_color_discrete(labels=c("Bounds", "90% CI of upper", "90% CI of lower")) +
  coord_flip() +
  facet_wrap(~cond_fac) +
  labs(y = "Treatment Effect",
       x = NULL,
       color = NULL)

plot_grid(p1, p2)

ggsave("C:/Users/aflor/Downloads/expfigs2.tiff", device="tiff")


## hist
polnar_subset <- read_dta("C:/Users/aflor/OneDrive - american.edu/ENDA Research/Trans Attitudes/Trans Exp 7/polnar_subset.dta")

p <- ggplot(polnar_subset, aes(x = transportability))

p1 <- p + geom_histogram(aes(y = ..density..)) +
  geom_density(color = "red") +
  ggthemes::theme_clean() +
  labs(x = "Transportation",
       y = "Density")

p <- ggplot(polnar_subset, aes(x = absorbption))

p2 <- p + geom_histogram(aes(y = ..density..)) +
  geom_density(color = "red") +
  ggthemes::theme_clean() +
  labs(x = "Absorption",
       y = "Density")

p <- ggplot(polnar_subset, aes(x = transportability, y = absorbption))

p3 <- p + geom_jitter(alpha = 0.2) +
  geom_smooth(size = 1.2, color = "red") +
  ggthemes::theme_clean() +
  labs(y = "Absorption",
       x = "Transportation")

cowplot::plot_grid(p1,p2,p3, nrow= 1)
