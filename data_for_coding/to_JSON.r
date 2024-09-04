pacman::p_load(tidyverse, rio, jsonlite)

rio::import("F:/OneDrive - HKUST Connect/Phd/网站范例/华东政法数据库项目网站/data_for_coding/基层治理中文文献数据.xlsx", setclass = "tibble") %>%
    #mutate(id = row_number()) %>%
    select(
        title = `Title-题名`,
        author = "Author-作者",
        source = "Source-文献来源",
        year = "Year-年",
        keywords = "关键词",
        summary = "摘要",
        institution = "机构"
    ) %>%
    mutate(
        across(everything(), \(x) str_trim(x) |> str_squish()),
        across(everything(), \(x) replace_na(x, "未知")),
    ) %>%
    sample_frac(size = 1) %>% 
    rio::export("F:/OneDrive - HKUST Connect/Phd/网站范例/华东政法数据库项目网站/docs/databases/基层治理文献摘编数据库/基层治理中文文献数据.json")

rio::import("F:/OneDrive - HKUST Connect/Phd/网站范例/华东政法数据库项目网站/data_for_coding/政治学名篇摘编汇总.xlsx", setclass = "tibble") %>%
    select(
        topic = "主题",
        summary = "经典摘录",
        source = "出处"
    ) %>%
    mutate(
        across(everything(), \(x) str_trim(x) |> str_squish()),
        across(everything(), \(x) replace_na(x, "未知")),
    ) %>%
    sample_frac(size = 1) %>% 
    rio::export("F:/OneDrive - HKUST Connect/Phd/网站范例/华东政法数据库项目网站/docs/databases/基层治理文献摘编数据库/政治学名篇摘编汇总.json")
