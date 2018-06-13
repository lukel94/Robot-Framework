



<!DOCTYPE html>
<html lang="en" class=" is-copy-enabled emoji-size-boost is-u2f-enabled">
  <head prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# object: http://ogp.me/ns/object# article: http://ogp.me/ns/article# profile: http://ogp.me/ns/profile#">
    <meta charset='utf-8'>

    <link crossorigin="anonymous" href="https://assets-cdn.github.com/assets/frameworks-0dd18d999f1e3d1e515cf15c5628a70a3859d1af1c5daadeaa73ab4adfdeae9e.css" integrity="sha256-DdGNmZ8ePR5RXPFcViinCjhZ0a8cXareqnOrSt/erp4=" media="all" rel="stylesheet" />
    <link crossorigin="anonymous" href="https://assets-cdn.github.com/assets/github-339b025c0a241ba6e6117ae728c3cc7ae6f887012df03d21694e6c3dd44fd6e3.css" integrity="sha256-M5sCXAokG6bmEXrnKMPMeub4hwEt8D0haU5sPdRP1uM=" media="all" rel="stylesheet" />
    
    
    <link crossorigin="anonymous" href="https://assets-cdn.github.com/assets/site-70dfb928c731b17636b56e4f6f97ffe02f2e3e94d71f2230379ece855d2904dd.css" integrity="sha256-cN+5KMcxsXY2tW5Pb5f/4C8uPpTXHyIwN57OhV0pBN0=" media="all" rel="stylesheet" />
    
    <link crossorigin="anonymous" href="https://assets-cdn.github.com/assets/system-fonts-d60dee4b68e3a38b01c0389551a0e38f04acd897ec85592f405d045ee853b3d1.css" integrity="sha256-1g3uS2jjo4sBwDiVUaDjjwSs2JfshVkvQF0EXuhTs9E=" media="all" rel="stylesheet" />

    <link as="script" href="https://assets-cdn.github.com/assets/frameworks-149d9338c2665172870825c78fa48fdcca4d431d067cbf5fda7120d9e39cc738.js" rel="preload" />
    
    <link as="script" href="https://assets-cdn.github.com/assets/github-b8399055ee2c55a5061cf4f292c6169e80e8dfa1ce0fa1d5f8aadf35d8c9bd4c.js" rel="preload" />

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Language" content="en">
    <meta name="viewport" content="width=device-width">
    
    
    <title>ruby/biorhythm.rb at trunk · ruby/ruby · GitHub</title>
    <link rel="search" type="application/opensearchdescription+xml" href="/opensearch.xml" title="GitHub">
    <link rel="fluid-icon" href="https://github.com/fluidicon.png" title="GitHub">
    <link rel="apple-touch-icon" href="/apple-touch-icon.png">
    <link rel="apple-touch-icon" sizes="57x57" href="/apple-touch-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="/apple-touch-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72" href="/apple-touch-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="/apple-touch-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114" href="/apple-touch-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120" href="/apple-touch-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="/apple-touch-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152" href="/apple-touch-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon-180x180.png">
    <meta property="fb:app_id" content="1401488693436528">

      <meta content="https://avatars2.githubusercontent.com/u/210414?v=3&amp;s=400" name="twitter:image:src" /><meta content="@github" name="twitter:site" /><meta content="summary" name="twitter:card" /><meta content="ruby/ruby" name="twitter:title" /><meta content="ruby - The Ruby Programming Language" name="twitter:description" />
      <meta content="https://avatars2.githubusercontent.com/u/210414?v=3&amp;s=400" property="og:image" /><meta content="GitHub" property="og:site_name" /><meta content="object" property="og:type" /><meta content="ruby/ruby" property="og:title" /><meta content="https://github.com/ruby/ruby" property="og:url" /><meta content="ruby - The Ruby Programming Language" property="og:description" />
      <meta name="browser-stats-url" content="https://api.github.com/_private/browser/stats">
    <meta name="browser-errors-url" content="https://api.github.com/_private/browser/errors">
    <link rel="assets" href="https://assets-cdn.github.com/">
    
    <meta name="pjax-timeout" content="1000">
    

    <meta name="msapplication-TileImage" content="/windows-tile.png">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="selected-link" value="repo_source" data-pjax-transient>

    <meta name="google-site-verification" content="KT5gs8h0wvaagLKAVWq8bbeNwnZZK1r1XQysX3xurLU">
<meta name="google-site-verification" content="ZzhVyEFwb7w3e0-uOTltm8Jsck2F5StVihD0exw2fsA">
    <meta name="google-analytics" content="UA-3769691-2">

<meta content="collector.githubapp.com" name="octolytics-host" /><meta content="github" name="octolytics-app-id" /><meta content="4281EF0F:7ABF:1249743:5787CAAB" name="octolytics-dimension-request_id" />
<meta content="/&lt;user-name&gt;/&lt;repo-name&gt;/blob/show" data-pjax-transient="true" name="analytics-location" />



  <meta class="js-ga-set" name="dimension1" content="Logged Out">



        <meta name="hostname" content="github.com">
    <meta name="user-login" content="">

        <meta name="expected-hostname" content="github.com">
      <meta name="js-proxy-site-detection-payload" content="ZjFmNTE0Mjg5OTk1ODlkODYwNDZkNTg5N2QzMTgyNDFmZjc1YTcxZmRjMWI1ZDg2NGZjNjMxNWE4YzBjYTY0NXx7InJlbW90ZV9hZGRyZXNzIjoiNjYuMTI5LjIzOS4xNSIsInJlcXVlc3RfaWQiOiI0MjgxRUYwRjo3QUJGOjEyNDk3NDM6NTc4N0NBQUIiLCJ0aW1lc3RhbXAiOjE0Njg1MTcwNDB9">


      <link rel="mask-icon" href="https://assets-cdn.github.com/pinned-octocat.svg" color="#4078c0">
      <link rel="icon" type="image/x-icon" href="https://assets-cdn.github.com/favicon.ico">

    <meta name="html-safe-nonce" content="60baaafb0d2b4b13835d3b1decd9a7b651a41186">
    <meta content="e2e81fd388e724a077b3f3b4660fd08d493f6dde" name="form-nonce" />

    <meta http-equiv="x-pjax-version" content="4446bf260994228021e196d84e470d03">
    

      
  <meta name="description" content="ruby - The Ruby Programming Language">
  <meta name="go-import" content="github.com/ruby/ruby git https://github.com/ruby/ruby.git">

  <meta content="210414" name="octolytics-dimension-user_id" /><meta content="ruby" name="octolytics-dimension-user_login" /><meta content="538746" name="octolytics-dimension-repository_id" /><meta content="ruby/ruby" name="octolytics-dimension-repository_nwo" /><meta content="true" name="octolytics-dimension-repository_public" /><meta content="false" name="octolytics-dimension-repository_is_fork" /><meta content="538746" name="octolytics-dimension-repository_network_root_id" /><meta content="ruby/ruby" name="octolytics-dimension-repository_network_root_nwo" />
  <link href="https://github.com/ruby/ruby/commits/trunk.atom" rel="alternate" title="Recent Commits to ruby:trunk" type="application/atom+xml">


      <link rel="canonical" href="https://github.com/ruby/ruby/blob/trunk/sample/biorhythm.rb" data-pjax-transient>
  </head>


  <body class="logged-out   env-production macintosh vis-public page-blob">
    <div id="js-pjax-loader-bar" class="pjax-loader-bar"></div>
    <a href="#start-of-content" tabindex="1" class="accessibility-aid js-skip-to-content">Skip to content</a>

    
    
    



          <header class="site-header js-details-container" role="banner">
  <div class="container-responsive">
    <a class="header-logo-invertocat" href="https://github.com/" aria-label="Homepage" data-ga-click="(Logged out) Header, go to homepage, icon:logo-wordmark">
      <svg aria-hidden="true" class="octicon octicon-mark-github" height="32" version="1.1" viewBox="0 0 16 16" width="32"><path d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27.68 0 1.36.09 2 .27 1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.013 8.013 0 0 0 16 8c0-4.42-3.58-8-8-8z"></path></svg>
    </a>

    <button class="btn-link right site-header-toggle js-details-target" type="button" aria-label="Toggle navigation">
      <svg aria-hidden="true" class="octicon octicon-three-bars" height="24" version="1.1" viewBox="0 0 12 16" width="18"><path d="M11.41 9H.59C0 9 0 8.59 0 8c0-.59 0-1 .59-1H11.4c.59 0 .59.41.59 1 0 .59 0 1-.59 1h.01zm0-4H.59C0 5 0 4.59 0 4c0-.59 0-1 .59-1H11.4c.59 0 .59.41.59 1 0 .59 0 1-.59 1h.01zM.59 11H11.4c.59 0 .59.41.59 1 0 .59 0 1-.59 1H.59C0 13 0 12.59 0 12c0-.59 0-1 .59-1z"></path></svg>
    </button>

    <div class="site-header-menu">
      <nav class="site-header-nav site-header-nav-main">
        <a href="/personal" class="js-selected-navigation-item nav-item nav-item-personal" data-ga-click="Header, click, Nav menu - item:personal" data-selected-links="/personal /personal">
          Personal
</a>        <a href="/open-source" class="js-selected-navigation-item nav-item nav-item-opensource" data-ga-click="Header, click, Nav menu - item:opensource" data-selected-links="/open-source /open-source">
          Open source
</a>        <a href="/business" class="js-selected-navigation-item nav-item nav-item-business" data-ga-click="Header, click, Nav menu - item:business" data-selected-links="/business /business/features /business/customers /business">
          Business
</a>        <a href="/explore" class="js-selected-navigation-item nav-item nav-item-explore" data-ga-click="Header, click, Nav menu - item:explore" data-selected-links="/explore /trending /trending/developers /integrations /integrations/feature/code /integrations/feature/collaborate /integrations/feature/ship /explore">
          Explore
</a>      </nav>

      <div class="site-header-actions">
            <a class="btn btn-primary site-header-actions-btn" href="/join?source=header-repo" data-ga-click="(Logged out) Header, clicked Sign up, text:sign-up">Sign up</a>
          <a class="btn site-header-actions-btn mr-2" href="/login?return_to=%2Fruby%2Fruby%2Fblob%2Ftrunk%2Fsample%2Fbiorhythm.rb" data-ga-click="(Logged out) Header, clicked Sign in, text:sign-in">Sign in</a>
      </div>

        <nav class="site-header-nav site-header-nav-secondary">
          <a class="nav-item" href="/pricing">Pricing</a>
          <a class="nav-item" href="/blog">Blog</a>
          <a class="nav-item" href="https://help.github.com">Support</a>
          <a class="nav-item header-search-link" href="https://github.com/search">Search GitHub</a>
              <div class="header-search scoped-search site-scoped-search js-site-search" role="search">
  <!-- </textarea> --><!-- '"` --><form accept-charset="UTF-8" action="/ruby/ruby/search" class="js-site-search-form" data-scoped-search-url="/ruby/ruby/search" data-unscoped-search-url="/search" method="get"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /></div>
    <label class="form-control header-search-wrapper js-chromeless-input-container">
      <div class="header-search-scope">This repository</div>
      <input type="text"
        class="form-control header-search-input js-site-search-focus js-site-search-field is-clearable"
        data-hotkey="s"
        name="q"
        placeholder="Search"
        aria-label="Search this repository"
        data-unscoped-placeholder="Search GitHub"
        data-scoped-placeholder="Search"
        tabindex="1"
        autocapitalize="off">
    </label>
</form></div>

        </nav>
    </div>
  </div>
</header>



    <div id="start-of-content" class="accessibility-aid"></div>

      <div id="js-flash-container">
</div>


    <div role="main">
        <div itemscope itemtype="http://schema.org/SoftwareSourceCode">
    <div id="js-repo-pjax-container" data-pjax-container>
      
<div class="pagehead repohead instapaper_ignore readability-menu experiment-repo-nav">
  <div class="container repohead-details-container">

    

<ul class="pagehead-actions">

  <li>
      <a href="/login?return_to=%2Fruby%2Fruby"
    class="btn btn-sm btn-with-count tooltipped tooltipped-n"
    aria-label="You must be signed in to watch a repository" rel="nofollow">
    <svg aria-hidden="true" class="octicon octicon-eye" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path d="M8.06 2C3 2 0 8 0 8s3 6 8.06 6C13 14 16 8 16 8s-3-6-7.94-6zM8 12c-2.2 0-4-1.78-4-4 0-2.2 1.8-4 4-4 2.22 0 4 1.8 4 4 0 2.22-1.78 4-4 4zm2-4c0 1.11-.89 2-2 2-1.11 0-2-.89-2-2 0-1.11.89-2 2-2 1.11 0 2 .89 2 2z"></path></svg>
    Watch
  </a>
  <a class="social-count" href="/ruby/ruby/watchers">
    1,055
  </a>

  </li>

  <li>
      <a href="/login?return_to=%2Fruby%2Fruby"
    class="btn btn-sm btn-with-count tooltipped tooltipped-n"
    aria-label="You must be signed in to star a repository" rel="nofollow">
    <svg aria-hidden="true" class="octicon octicon-star" height="16" version="1.1" viewBox="0 0 14 16" width="14"><path d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74z"></path></svg>
    Star
  </a>

    <a class="social-count js-social-count" href="/ruby/ruby/stargazers">
      10,139
    </a>

  </li>

  <li>
      <a href="/login?return_to=%2Fruby%2Fruby"
        class="btn btn-sm btn-with-count tooltipped tooltipped-n"
        aria-label="You must be signed in to fork a repository" rel="nofollow">
        <svg aria-hidden="true" class="octicon octicon-repo-forked" height="16" version="1.1" viewBox="0 0 10 16" width="10"><path d="M8 1a1.993 1.993 0 0 0-1 3.72V6L5 8 3 6V4.72A1.993 1.993 0 0 0 2 1a1.993 1.993 0 0 0-1 3.72V6.5l3 3v1.78A1.993 1.993 0 0 0 5 15a1.993 1.993 0 0 0 1-3.72V9.5l3-3V4.72A1.993 1.993 0 0 0 8 1zM2 4.2C1.34 4.2.8 3.65.8 3c0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zm3 10c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zm3-10c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2z"></path></svg>
        Fork
      </a>

    <a href="/ruby/ruby/network" class="social-count">
      2,956
    </a>
  </li>
</ul>

    <h1 class="public ">
  <svg aria-hidden="true" class="octicon octicon-repo" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M4 9H3V8h1v1zm0-3H3v1h1V6zm0-2H3v1h1V4zm0-2H3v1h1V2zm8-1v12c0 .55-.45 1-1 1H6v2l-1.5-1.5L3 16v-2H1c-.55 0-1-.45-1-1V1c0-.55.45-1 1-1h10c.55 0 1 .45 1 1zm-1 10H1v2h2v-1h3v1h5v-2zm0-10H2v9h9V1z"></path></svg>
  <span class="author" itemprop="author"><a href="/ruby" class="url fn" rel="author">ruby</a></span><!--
--><span class="path-divider">/</span><!--
--><strong itemprop="name"><a href="/ruby/ruby" data-pjax="#js-repo-pjax-container">ruby</a></strong>

</h1>

  </div>
  <div class="container">
    
<nav class="reponav js-repo-nav js-sidenav-container-pjax"
     itemscope
     itemtype="http://schema.org/BreadcrumbList"
     role="navigation"
     data-pjax="#js-repo-pjax-container">

  <span itemscope itemtype="http://schema.org/ListItem" itemprop="itemListElement">
    <a href="/ruby/ruby" aria-selected="true" class="js-selected-navigation-item selected reponav-item" data-hotkey="g c" data-selected-links="repo_source repo_downloads repo_commits repo_releases repo_tags repo_branches /ruby/ruby" itemprop="url">
      <svg aria-hidden="true" class="octicon octicon-code" height="16" version="1.1" viewBox="0 0 14 16" width="14"><path d="M9.5 3L8 4.5 11.5 8 8 11.5 9.5 13 14 8 9.5 3zm-5 0L0 8l4.5 5L6 11.5 2.5 8 6 4.5 4.5 3z"></path></svg>
      <span itemprop="name">Code</span>
      <meta itemprop="position" content="1">
</a>  </span>


  <span itemscope itemtype="http://schema.org/ListItem" itemprop="itemListElement">
    <a href="/ruby/ruby/pulls" class="js-selected-navigation-item reponav-item" data-hotkey="g p" data-selected-links="repo_pulls /ruby/ruby/pulls" itemprop="url">
      <svg aria-hidden="true" class="octicon octicon-git-pull-request" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M11 11.28V5c-.03-.78-.34-1.47-.94-2.06C9.46 2.35 8.78 2.03 8 2H7V0L4 3l3 3V4h1c.27.02.48.11.69.31.21.2.3.42.31.69v6.28A1.993 1.993 0 0 0 10 15a1.993 1.993 0 0 0 1-3.72zm-1 2.92c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zM4 3c0-1.11-.89-2-2-2a1.993 1.993 0 0 0-1 3.72v6.56A1.993 1.993 0 0 0 2 15a1.993 1.993 0 0 0 1-3.72V4.72c.59-.34 1-.98 1-1.72zm-.8 10c0 .66-.55 1.2-1.2 1.2-.65 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2zM2 4.2C1.34 4.2.8 3.65.8 3c0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2z"></path></svg>
      <span itemprop="name">Pull requests</span>
      <span class="counter">141</span>
      <meta itemprop="position" content="3">
</a>  </span>



  <a href="/ruby/ruby/pulse" class="js-selected-navigation-item reponav-item" data-selected-links="pulse /ruby/ruby/pulse">
    <svg aria-hidden="true" class="octicon octicon-pulse" height="16" version="1.1" viewBox="0 0 14 16" width="14"><path d="M11.5 8L8.8 5.4 6.6 8.5 5.5 1.6 2.38 8H0v2h3.6l.9-1.8.9 5.4L9 8.5l1.6 1.5H14V8z"></path></svg>
    Pulse
</a>
  <a href="/ruby/ruby/graphs" class="js-selected-navigation-item reponav-item" data-selected-links="repo_graphs repo_contributors /ruby/ruby/graphs">
    <svg aria-hidden="true" class="octicon octicon-graph" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path d="M16 14v1H0V0h1v14h15zM5 13H3V8h2v5zm4 0H7V3h2v10zm4 0h-2V6h2v7z"></path></svg>
    Graphs
</a>

</nav>

  </div>
</div>

<div class="container new-discussion-timeline experiment-repo-nav">
  <div class="repository-content">

    

<a href="/ruby/ruby/blob/0fd7666d57f9919962ae28ae7a6758451e10cd11/sample/biorhythm.rb" class="hidden js-permalink-shortcut" data-hotkey="y">Permalink</a>

<!-- blob contrib key: blob_contributors:v21:6b9a3b28fec0e0ae61f3654bc82cade5 -->

<div class="file-navigation js-zeroclipboard-container">
  
<div class="select-menu branch-select-menu js-menu-container js-select-menu left">
  <button class="btn btn-sm select-menu-button js-menu-target css-truncate" data-hotkey="w"
    title="trunk"
    type="button" aria-label="Switch branches or tags" tabindex="0" aria-haspopup="true">
    <i>Branch:</i>
    <span class="js-select-button css-truncate-target">trunk</span>
  </button>

  <div class="select-menu-modal-holder js-menu-content js-navigation-container" data-pjax aria-hidden="true">

    <div class="select-menu-modal">
      <div class="select-menu-header">
        <svg aria-label="Close" class="octicon octicon-x js-menu-close" height="16" role="img" version="1.1" viewBox="0 0 12 16" width="12"><path d="M7.48 8l3.75 3.75-1.48 1.48L6 9.48l-3.75 3.75-1.48-1.48L4.52 8 .77 4.25l1.48-1.48L6 6.52l3.75-3.75 1.48 1.48z"></path></svg>
        <span class="select-menu-title">Switch branches/tags</span>
      </div>

      <div class="select-menu-filters">
        <div class="select-menu-text-filter">
          <input type="text" aria-label="Filter branches/tags" id="context-commitish-filter-field" class="form-control js-filterable-field js-navigation-enable" placeholder="Filter branches/tags">
        </div>
        <div class="select-menu-tabs">
          <ul>
            <li class="select-menu-tab">
              <a href="#" data-tab-filter="branches" data-filter-placeholder="Filter branches/tags" class="js-select-menu-tab" role="tab">Branches</a>
            </li>
            <li class="select-menu-tab">
              <a href="#" data-tab-filter="tags" data-filter-placeholder="Find a tag…" class="js-select-menu-tab" role="tab">Tags</a>
            </li>
          </ul>
        </div>
      </div>

      <div class="select-menu-list select-menu-tab-bucket js-select-menu-tab-bucket" data-tab-filter="branches" role="menu">

        <div data-filterable-for="context-commitish-filter-field" data-filterable-type="substring">


            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/ruby/ruby/blob/ruby_1_3/sample/biorhythm.rb"
               data-name="ruby_1_3"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text" title="ruby_1_3">
                ruby_1_3
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/ruby/ruby/blob/ruby_1_4/sample/biorhythm.rb"
               data-name="ruby_1_4"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text" title="ruby_1_4">
                ruby_1_4
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/ruby/ruby/blob/ruby_1_6/sample/biorhythm.rb"
               data-name="ruby_1_6"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text" title="ruby_1_6">
                ruby_1_6
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/ruby/ruby/blob/ruby_1_8/sample/biorhythm.rb"
               data-name="ruby_1_8"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text" title="ruby_1_8">
                ruby_1_8
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/ruby/ruby/blob/ruby_1_8_5/sample/biorhythm.rb"
               data-name="ruby_1_8_5"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text" title="ruby_1_8_5">
                ruby_1_8_5
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/ruby/ruby/blob/ruby_1_8_6/sample/biorhythm.rb"
               data-name="ruby_1_8_6"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text" title="ruby_1_8_6">
                ruby_1_8_6
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/ruby/ruby/blob/ruby_1_8_7/sample/biorhythm.rb"
               data-name="ruby_1_8_7"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text" title="ruby_1_8_7">
                ruby_1_8_7
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/ruby/ruby/blob/ruby_1_9_1/sample/biorhythm.rb"
               data-name="ruby_1_9_1"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text" title="ruby_1_9_1">
                ruby_1_9_1
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/ruby/ruby/blob/ruby_1_9_2/sample/biorhythm.rb"
               data-name="ruby_1_9_2"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text" title="ruby_1_9_2">
                ruby_1_9_2
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/ruby/ruby/blob/ruby_1_9_3/sample/biorhythm.rb"
               data-name="ruby_1_9_3"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text" title="ruby_1_9_3">
                ruby_1_9_3
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/ruby/ruby/blob/ruby_2_0_0/sample/biorhythm.rb"
               data-name="ruby_2_0_0"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text" title="ruby_2_0_0">
                ruby_2_0_0
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/ruby/ruby/blob/ruby_2_1/sample/biorhythm.rb"
               data-name="ruby_2_1"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text" title="ruby_2_1">
                ruby_2_1
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/ruby/ruby/blob/ruby_2_2/sample/biorhythm.rb"
               data-name="ruby_2_2"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text" title="ruby_2_2">
                ruby_2_2
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/ruby/ruby/blob/ruby_2_3/sample/biorhythm.rb"
               data-name="ruby_2_3"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text" title="ruby_2_3">
                ruby_2_3
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open selected"
               href="/ruby/ruby/blob/trunk/sample/biorhythm.rb"
               data-name="trunk"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text" title="trunk">
                trunk
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/ruby/ruby/blob/v1_0r/sample/biorhythm.rb"
               data-name="v1_0r"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text" title="v1_0r">
                v1_0r
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/ruby/ruby/blob/v1_1dev/sample/biorhythm.rb"
               data-name="v1_1dev"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text" title="v1_1dev">
                v1_1dev
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/ruby/ruby/blob/v1_1r/sample/biorhythm.rb"
               data-name="v1_1r"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text" title="v1_1r">
                v1_1r
              </span>
            </a>
        </div>

          <div class="select-menu-no-results">Nothing to show</div>
      </div>

      <div class="select-menu-list select-menu-tab-bucket js-select-menu-tab-bucket" data-tab-filter="tags">
        <div data-filterable-for="context-commitish-filter-field" data-filterable-type="substring">


            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/yarv_migration_base/sample/biorhythm.rb"
              data-name="yarv_migration_base"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="yarv_migration_base">
                yarv_migration_base
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v2_4_0_preview1/sample/biorhythm.rb"
              data-name="v2_4_0_preview1"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v2_4_0_preview1">
                v2_4_0_preview1
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v2_3_1/sample/biorhythm.rb"
              data-name="v2_3_1"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v2_3_1">
                v2_3_1
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v2_3_0/sample/biorhythm.rb"
              data-name="v2_3_0"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v2_3_0">
                v2_3_0
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v2_3_0_preview2/sample/biorhythm.rb"
              data-name="v2_3_0_preview2"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v2_3_0_preview2">
                v2_3_0_preview2
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v2_3_0_preview1/sample/biorhythm.rb"
              data-name="v2_3_0_preview1"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v2_3_0_preview1">
                v2_3_0_preview1
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v2_2_5/sample/biorhythm.rb"
              data-name="v2_2_5"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v2_2_5">
                v2_2_5
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v2_2_4/sample/biorhythm.rb"
              data-name="v2_2_4"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v2_2_4">
                v2_2_4
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v2_2_3/sample/biorhythm.rb"
              data-name="v2_2_3"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v2_2_3">
                v2_2_3
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v2_2_2/sample/biorhythm.rb"
              data-name="v2_2_2"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v2_2_2">
                v2_2_2
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v2_2_1/sample/biorhythm.rb"
              data-name="v2_2_1"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v2_2_1">
                v2_2_1
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v2_2_0/sample/biorhythm.rb"
              data-name="v2_2_0"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v2_2_0">
                v2_2_0
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v2_2_0_rc1/sample/biorhythm.rb"
              data-name="v2_2_0_rc1"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v2_2_0_rc1">
                v2_2_0_rc1
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v2_2_0_preview2/sample/biorhythm.rb"
              data-name="v2_2_0_preview2"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v2_2_0_preview2">
                v2_2_0_preview2
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v2_2_0_preview1/sample/biorhythm.rb"
              data-name="v2_2_0_preview1"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v2_2_0_preview1">
                v2_2_0_preview1
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v2_1_10/sample/biorhythm.rb"
              data-name="v2_1_10"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v2_1_10">
                v2_1_10
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v2_1_9/sample/biorhythm.rb"
              data-name="v2_1_9"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v2_1_9">
                v2_1_9
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v2_1_8/sample/biorhythm.rb"
              data-name="v2_1_8"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v2_1_8">
                v2_1_8
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v2_1_7/sample/biorhythm.rb"
              data-name="v2_1_7"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v2_1_7">
                v2_1_7
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v2_1_6/sample/biorhythm.rb"
              data-name="v2_1_6"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v2_1_6">
                v2_1_6
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v2_1_5/sample/biorhythm.rb"
              data-name="v2_1_5"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v2_1_5">
                v2_1_5
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v2_1_4/sample/biorhythm.rb"
              data-name="v2_1_4"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v2_1_4">
                v2_1_4
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v2_1_3/sample/biorhythm.rb"
              data-name="v2_1_3"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v2_1_3">
                v2_1_3
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v2_1_2/sample/biorhythm.rb"
              data-name="v2_1_2"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v2_1_2">
                v2_1_2
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v2_1_1/sample/biorhythm.rb"
              data-name="v2_1_1"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v2_1_1">
                v2_1_1
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v2_1_0/sample/biorhythm.rb"
              data-name="v2_1_0"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v2_1_0">
                v2_1_0
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v2_1_0_rc1/sample/biorhythm.rb"
              data-name="v2_1_0_rc1"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v2_1_0_rc1">
                v2_1_0_rc1
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v2_1_0_preview2/sample/biorhythm.rb"
              data-name="v2_1_0_preview2"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v2_1_0_preview2">
                v2_1_0_preview2
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v2_1_0_preview1/sample/biorhythm.rb"
              data-name="v2_1_0_preview1"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v2_1_0_preview1">
                v2_1_0_preview1
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v2_0_0_648/sample/biorhythm.rb"
              data-name="v2_0_0_648"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v2_0_0_648">
                v2_0_0_648
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v2_0_0_647/sample/biorhythm.rb"
              data-name="v2_0_0_647"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v2_0_0_647">
                v2_0_0_647
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v2_0_0_645/sample/biorhythm.rb"
              data-name="v2_0_0_645"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v2_0_0_645">
                v2_0_0_645
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v2_0_0_643/sample/biorhythm.rb"
              data-name="v2_0_0_643"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v2_0_0_643">
                v2_0_0_643
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v2_0_0_598/sample/biorhythm.rb"
              data-name="v2_0_0_598"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v2_0_0_598">
                v2_0_0_598
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v2_0_0_594/sample/biorhythm.rb"
              data-name="v2_0_0_594"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v2_0_0_594">
                v2_0_0_594
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v2_0_0_576/sample/biorhythm.rb"
              data-name="v2_0_0_576"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v2_0_0_576">
                v2_0_0_576
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v2_0_0_481/sample/biorhythm.rb"
              data-name="v2_0_0_481"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v2_0_0_481">
                v2_0_0_481
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v2_0_0_451/sample/biorhythm.rb"
              data-name="v2_0_0_451"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v2_0_0_451">
                v2_0_0_451
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v2_0_0_353/sample/biorhythm.rb"
              data-name="v2_0_0_353"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v2_0_0_353">
                v2_0_0_353
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v2_0_0_352/sample/biorhythm.rb"
              data-name="v2_0_0_352"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v2_0_0_352">
                v2_0_0_352
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v2_0_0_247/sample/biorhythm.rb"
              data-name="v2_0_0_247"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v2_0_0_247">
                v2_0_0_247
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v2_0_0_195/sample/biorhythm.rb"
              data-name="v2_0_0_195"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v2_0_0_195">
                v2_0_0_195
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v2_0_0_0/sample/biorhythm.rb"
              data-name="v2_0_0_0"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v2_0_0_0">
                v2_0_0_0
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v2_0_0_rc2/sample/biorhythm.rb"
              data-name="v2_0_0_rc2"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v2_0_0_rc2">
                v2_0_0_rc2
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v2_0_0_rc1/sample/biorhythm.rb"
              data-name="v2_0_0_rc1"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v2_0_0_rc1">
                v2_0_0_rc1
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v2_0_0_preview2/sample/biorhythm.rb"
              data-name="v2_0_0_preview2"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v2_0_0_preview2">
                v2_0_0_preview2
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v2_0_0_preview1/sample/biorhythm.rb"
              data-name="v2_0_0_preview1"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v2_0_0_preview1">
                v2_0_0_preview1
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v1_9_3_551/sample/biorhythm.rb"
              data-name="v1_9_3_551"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v1_9_3_551">
                v1_9_3_551
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v1_9_3_550/sample/biorhythm.rb"
              data-name="v1_9_3_550"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v1_9_3_550">
                v1_9_3_550
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v1_9_3_547/sample/biorhythm.rb"
              data-name="v1_9_3_547"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v1_9_3_547">
                v1_9_3_547
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v1_9_3_545/sample/biorhythm.rb"
              data-name="v1_9_3_545"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v1_9_3_545">
                v1_9_3_545
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v1_9_3_484/sample/biorhythm.rb"
              data-name="v1_9_3_484"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v1_9_3_484">
                v1_9_3_484
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v1_9_3_483/sample/biorhythm.rb"
              data-name="v1_9_3_483"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v1_9_3_483">
                v1_9_3_483
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v1_9_3_448/sample/biorhythm.rb"
              data-name="v1_9_3_448"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v1_9_3_448">
                v1_9_3_448
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v1_9_3_429/sample/biorhythm.rb"
              data-name="v1_9_3_429"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v1_9_3_429">
                v1_9_3_429
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v1_9_3_426/sample/biorhythm.rb"
              data-name="v1_9_3_426"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v1_9_3_426">
                v1_9_3_426
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v1_9_3_392/sample/biorhythm.rb"
              data-name="v1_9_3_392"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v1_9_3_392">
                v1_9_3_392
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v1_9_3_385/sample/biorhythm.rb"
              data-name="v1_9_3_385"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v1_9_3_385">
                v1_9_3_385
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v1_9_3_384/sample/biorhythm.rb"
              data-name="v1_9_3_384"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v1_9_3_384">
                v1_9_3_384
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v1_9_3_383/sample/biorhythm.rb"
              data-name="v1_9_3_383"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v1_9_3_383">
                v1_9_3_383
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v1_9_3_374/sample/biorhythm.rb"
              data-name="v1_9_3_374"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v1_9_3_374">
                v1_9_3_374
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v1_9_3_362/sample/biorhythm.rb"
              data-name="v1_9_3_362"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v1_9_3_362">
                v1_9_3_362
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v1_9_3_361/sample/biorhythm.rb"
              data-name="v1_9_3_361"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v1_9_3_361">
                v1_9_3_361
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v1_9_3_360/sample/biorhythm.rb"
              data-name="v1_9_3_360"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v1_9_3_360">
                v1_9_3_360
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v1_9_3_327/sample/biorhythm.rb"
              data-name="v1_9_3_327"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v1_9_3_327">
                v1_9_3_327
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v1_9_3_326/sample/biorhythm.rb"
              data-name="v1_9_3_326"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v1_9_3_326">
                v1_9_3_326
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v1_9_3_286/sample/biorhythm.rb"
              data-name="v1_9_3_286"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v1_9_3_286">
                v1_9_3_286
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v1_9_3_195/sample/biorhythm.rb"
              data-name="v1_9_3_195"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v1_9_3_195">
                v1_9_3_195
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v1_9_3_194/sample/biorhythm.rb"
              data-name="v1_9_3_194"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v1_9_3_194">
                v1_9_3_194
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v1_9_3_125/sample/biorhythm.rb"
              data-name="v1_9_3_125"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v1_9_3_125">
                v1_9_3_125
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v1_9_3_0/sample/biorhythm.rb"
              data-name="v1_9_3_0"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v1_9_3_0">
                v1_9_3_0
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v1_9_3_rc1/sample/biorhythm.rb"
              data-name="v1_9_3_rc1"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v1_9_3_rc1">
                v1_9_3_rc1
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v1_9_3_preview1/sample/biorhythm.rb"
              data-name="v1_9_3_preview1"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v1_9_3_preview1">
                v1_9_3_preview1
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v1_9_2_381/sample/biorhythm.rb"
              data-name="v1_9_2_381"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v1_9_2_381">
                v1_9_2_381
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v1_9_2_320/sample/biorhythm.rb"
              data-name="v1_9_2_320"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v1_9_2_320">
                v1_9_2_320
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v1_9_2_318/sample/biorhythm.rb"
              data-name="v1_9_2_318"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v1_9_2_318">
                v1_9_2_318
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v1_9_2_290/sample/biorhythm.rb"
              data-name="v1_9_2_290"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v1_9_2_290">
                v1_9_2_290
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v1_9_2_180/sample/biorhythm.rb"
              data-name="v1_9_2_180"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v1_9_2_180">
                v1_9_2_180
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v1_9_2_136/sample/biorhythm.rb"
              data-name="v1_9_2_136"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v1_9_2_136">
                v1_9_2_136
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v1_9_2_0/sample/biorhythm.rb"
              data-name="v1_9_2_0"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v1_9_2_0">
                v1_9_2_0
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v1_9_2_rc2/sample/biorhythm.rb"
              data-name="v1_9_2_rc2"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v1_9_2_rc2">
                v1_9_2_rc2
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v1_9_2_rc1/sample/biorhythm.rb"
              data-name="v1_9_2_rc1"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v1_9_2_rc1">
                v1_9_2_rc1
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v1_9_2_preview3/sample/biorhythm.rb"
              data-name="v1_9_2_preview3"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v1_9_2_preview3">
                v1_9_2_preview3
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v1_9_2_preview2/sample/biorhythm.rb"
              data-name="v1_9_2_preview2"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v1_9_2_preview2">
                v1_9_2_preview2
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v1_9_2_preview1/sample/biorhythm.rb"
              data-name="v1_9_2_preview1"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v1_9_2_preview1">
                v1_9_2_preview1
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v1_9_1_431/sample/biorhythm.rb"
              data-name="v1_9_1_431"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v1_9_1_431">
                v1_9_1_431
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v1_9_1_430/sample/biorhythm.rb"
              data-name="v1_9_1_430"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v1_9_1_430">
                v1_9_1_430
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v1_9_1_429/sample/biorhythm.rb"
              data-name="v1_9_1_429"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v1_9_1_429">
                v1_9_1_429
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v1_9_1_378/sample/biorhythm.rb"
              data-name="v1_9_1_378"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v1_9_1_378">
                v1_9_1_378
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v1_9_1_376/sample/biorhythm.rb"
              data-name="v1_9_1_376"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v1_9_1_376">
                v1_9_1_376
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v1_9_1_243/sample/biorhythm.rb"
              data-name="v1_9_1_243"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v1_9_1_243">
                v1_9_1_243
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v1_9_1_129/sample/biorhythm.rb"
              data-name="v1_9_1_129"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v1_9_1_129">
                v1_9_1_129
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v1_9_1_128/sample/biorhythm.rb"
              data-name="v1_9_1_128"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v1_9_1_128">
                v1_9_1_128
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v1_9_1_127/sample/biorhythm.rb"
              data-name="v1_9_1_127"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v1_9_1_127">
                v1_9_1_127
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v1_9_1_126/sample/biorhythm.rb"
              data-name="v1_9_1_126"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v1_9_1_126">
                v1_9_1_126
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v1_9_1_0/sample/biorhythm.rb"
              data-name="v1_9_1_0"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v1_9_1_0">
                v1_9_1_0
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v1_9_1_rc2/sample/biorhythm.rb"
              data-name="v1_9_1_rc2"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v1_9_1_rc2">
                v1_9_1_rc2
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v1_9_1_rc1/sample/biorhythm.rb"
              data-name="v1_9_1_rc1"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v1_9_1_rc1">
                v1_9_1_rc1
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v1_9_1_preview2/sample/biorhythm.rb"
              data-name="v1_9_1_preview2"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v1_9_1_preview2">
                v1_9_1_preview2
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/ruby/ruby/tree/v1_9_1_preview1/sample/biorhythm.rb"
              data-name="v1_9_1_preview1"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"></path></svg>
              <span class="select-menu-item-text css-truncate-target" title="v1_9_1_preview1">
                v1_9_1_preview1
              </span>
            </a>
        </div>

        <div class="select-menu-no-results">Nothing to show</div>
      </div>

    </div>
  </div>
</div>

  <div class="btn-group right">
    <a href="/ruby/ruby/find/trunk"
          class="js-pjax-capture-input btn btn-sm"
          data-pjax
          data-hotkey="t">
      Find file
    </a>
    <button aria-label="Copy file path to clipboard" class="js-zeroclipboard btn btn-sm zeroclipboard-button tooltipped tooltipped-s" data-copied-hint="Copied!" type="button">Copy path</button>
  </div>
  <div class="breadcrumb js-zeroclipboard-target">
    <span class="repo-root js-repo-root"><span class="js-path-segment"><a href="/ruby/ruby"><span>ruby</span></a></span></span><span class="separator">/</span><span class="js-path-segment"><a href="/ruby/ruby/tree/trunk/sample"><span>sample</span></a></span><span class="separator">/</span><strong class="final-path">biorhythm.rb</strong>
  </div>
</div>

<include-fragment class="commit-tease" src="/ruby/ruby/contributors/trunk/sample/biorhythm.rb">
  <div>
    Fetching contributors&hellip;
  </div>

  <div class="commit-tease-contributors">
    <img alt="" class="loader-loading left" height="16" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32-EAF2F5.gif" width="16" />
    <span class="loader-error">Cannot retrieve contributors at this time</span>
  </div>
</include-fragment>
<div class="file">
  <div class="file-header">
  <div class="file-actions">

    <div class="btn-group">
      <a href="/ruby/ruby/raw/trunk/sample/biorhythm.rb" class="btn btn-sm " id="raw-url">Raw</a>
        <a href="/ruby/ruby/blame/trunk/sample/biorhythm.rb" class="btn btn-sm js-update-url-with-hash">Blame</a>
      <a href="/ruby/ruby/commits/trunk/sample/biorhythm.rb" class="btn btn-sm " rel="nofollow">History</a>
    </div>

        <a class="btn-octicon tooltipped tooltipped-nw"
           href="https://mac.github.com"
           aria-label="Open this file in GitHub Desktop"
           data-ga-click="Repository, open with desktop, type:mac">
            <svg aria-hidden="true" class="octicon octicon-device-desktop" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path d="M15 2H1c-.55 0-1 .45-1 1v9c0 .55.45 1 1 1h5.34c-.25.61-.86 1.39-2.34 2h8c-1.48-.61-2.09-1.39-2.34-2H15c.55 0 1-.45 1-1V3c0-.55-.45-1-1-1zm0 9H1V3h14v8z"></path></svg>
        </a>

        <button type="button" class="btn-octicon disabled tooltipped tooltipped-nw"
          aria-label="You must be signed in to make or propose changes">
          <svg aria-hidden="true" class="octicon octicon-pencil" height="16" version="1.1" viewBox="0 0 14 16" width="14"><path d="M0 12v3h3l8-8-3-3-8 8zm3 2H1v-2h1v1h1v1zm10.3-9.3L12 6 9 3l1.3-1.3a.996.996 0 0 1 1.41 0l1.59 1.59c.39.39.39 1.02 0 1.41z"></path></svg>
        </button>
        <button type="button" class="btn-octicon btn-octicon-danger disabled tooltipped tooltipped-nw"
          aria-label="You must be signed in to make or propose changes">
          <svg aria-hidden="true" class="octicon octicon-trashcan" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M11 2H9c0-.55-.45-1-1-1H5c-.55 0-1 .45-1 1H2c-.55 0-1 .45-1 1v1c0 .55.45 1 1 1v9c0 .55.45 1 1 1h7c.55 0 1-.45 1-1V5c.55 0 1-.45 1-1V3c0-.55-.45-1-1-1zm-1 12H3V5h1v8h1V5h1v8h1V5h1v8h1V5h1v9zm1-10H2V3h9v1z"></path></svg>
        </button>
  </div>

  <div class="file-info">
      125 lines (113 sloc)
      <span class="file-info-divider"></span>
    3.34 KB
  </div>
</div>

  

  <div itemprop="text" class="blob-wrapper data type-ruby">
      <table class="highlight tab-size js-file-line-container" data-tab-size="8">
      <tr>
        <td id="L1" class="blob-num js-line-number" data-line-number="1"></td>
        <td id="LC1" class="blob-code blob-code-inner js-file-line"><span class="pl-c">#!/usr/local/bin/ruby</span></td>
      </tr>
      <tr>
        <td id="L2" class="blob-num js-line-number" data-line-number="2"></td>
        <td id="LC2" class="blob-code blob-code-inner js-file-line"><span class="pl-c">#</span></td>
      </tr>
      <tr>
        <td id="L3" class="blob-num js-line-number" data-line-number="3"></td>
        <td id="LC3" class="blob-code blob-code-inner js-file-line"><span class="pl-c">#               biorhythm.rb -</span></td>
      </tr>
      <tr>
        <td id="L4" class="blob-num js-line-number" data-line-number="4"></td>
        <td id="LC4" class="blob-code blob-code-inner js-file-line"><span class="pl-c">#                       $Release Version: $</span></td>
      </tr>
      <tr>
        <td id="L5" class="blob-num js-line-number" data-line-number="5"></td>
        <td id="LC5" class="blob-code blob-code-inner js-file-line"><span class="pl-c">#                       $Revision$</span></td>
      </tr>
      <tr>
        <td id="L6" class="blob-num js-line-number" data-line-number="6"></td>
        <td id="LC6" class="blob-code blob-code-inner js-file-line"><span class="pl-c">#                       by Yasuo OHBA(STAFS Development Room)</span></td>
      </tr>
      <tr>
        <td id="L7" class="blob-num js-line-number" data-line-number="7"></td>
        <td id="LC7" class="blob-code blob-code-inner js-file-line"><span class="pl-c">#</span></td>
      </tr>
      <tr>
        <td id="L8" class="blob-num js-line-number" data-line-number="8"></td>
        <td id="LC8" class="blob-code blob-code-inner js-file-line"><span class="pl-c"># --</span></td>
      </tr>
      <tr>
        <td id="L9" class="blob-num js-line-number" data-line-number="9"></td>
        <td id="LC9" class="blob-code blob-code-inner js-file-line"><span class="pl-c">#</span></td>
      </tr>
      <tr>
        <td id="L10" class="blob-num js-line-number" data-line-number="10"></td>
        <td id="LC10" class="blob-code blob-code-inner js-file-line"><span class="pl-c">#</span></td>
      </tr>
      <tr>
        <td id="L11" class="blob-num js-line-number" data-line-number="11"></td>
        <td id="LC11" class="blob-code blob-code-inner js-file-line"><span class="pl-c">#</span></td>
      </tr>
      <tr>
        <td id="L12" class="blob-num js-line-number" data-line-number="12"></td>
        <td id="LC12" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L13" class="blob-num js-line-number" data-line-number="13"></td>
        <td id="LC13" class="blob-code blob-code-inner js-file-line"><span class="pl-c"># probably based on:</span></td>
      </tr>
      <tr>
        <td id="L14" class="blob-num js-line-number" data-line-number="14"></td>
        <td id="LC14" class="blob-code blob-code-inner js-file-line"><span class="pl-c">#</span></td>
      </tr>
      <tr>
        <td id="L15" class="blob-num js-line-number" data-line-number="15"></td>
        <td id="LC15" class="blob-code blob-code-inner js-file-line"><span class="pl-c"># Newsgroups: comp.sources.misc,de.comp.sources.os9</span></td>
      </tr>
      <tr>
        <td id="L16" class="blob-num js-line-number" data-line-number="16"></td>
        <td id="LC16" class="blob-code blob-code-inner js-file-line"><span class="pl-c"># From: fkk@stasys.sta.sub.org (Frank Kaefer)</span></td>
      </tr>
      <tr>
        <td id="L17" class="blob-num js-line-number" data-line-number="17"></td>
        <td id="LC17" class="blob-code blob-code-inner js-file-line"><span class="pl-c"># Subject: v41i126:  br - Biorhythm v3.0, Part01/01</span></td>
      </tr>
      <tr>
        <td id="L18" class="blob-num js-line-number" data-line-number="18"></td>
        <td id="LC18" class="blob-code blob-code-inner js-file-line"><span class="pl-c"># Message-ID: &lt;1994Feb1.070616.15982@sparky.sterling.com&gt;</span></td>
      </tr>
      <tr>
        <td id="L19" class="blob-num js-line-number" data-line-number="19"></td>
        <td id="LC19" class="blob-code blob-code-inner js-file-line"><span class="pl-c"># Sender: kent@sparky.sterling.com (Kent Landfield)</span></td>
      </tr>
      <tr>
        <td id="L20" class="blob-num js-line-number" data-line-number="20"></td>
        <td id="LC20" class="blob-code blob-code-inner js-file-line"><span class="pl-c"># Organization: Sterling Software</span></td>
      </tr>
      <tr>
        <td id="L21" class="blob-num js-line-number" data-line-number="21"></td>
        <td id="LC21" class="blob-code blob-code-inner js-file-line"><span class="pl-c"># Date: Tue, 1 Feb 1994 07:06:16 GMT</span></td>
      </tr>
      <tr>
        <td id="L22" class="blob-num js-line-number" data-line-number="22"></td>
        <td id="LC22" class="blob-code blob-code-inner js-file-line"><span class="pl-c">#</span></td>
      </tr>
      <tr>
        <td id="L23" class="blob-num js-line-number" data-line-number="23"></td>
        <td id="LC23" class="blob-code blob-code-inner js-file-line"><span class="pl-c"># Posting-number: Volume 41, Issue 126</span></td>
      </tr>
      <tr>
        <td id="L24" class="blob-num js-line-number" data-line-number="24"></td>
        <td id="LC24" class="blob-code blob-code-inner js-file-line"><span class="pl-c"># Archive-name: br/part01</span></td>
      </tr>
      <tr>
        <td id="L25" class="blob-num js-line-number" data-line-number="25"></td>
        <td id="LC25" class="blob-code blob-code-inner js-file-line"><span class="pl-c"># Environment: basic, dos, os9</span></td>
      </tr>
      <tr>
        <td id="L26" class="blob-num js-line-number" data-line-number="26"></td>
        <td id="LC26" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L27" class="blob-num js-line-number" data-line-number="27"></td>
        <td id="LC27" class="blob-code blob-code-inner js-file-line"><span class="pl-k">include</span> <span class="pl-c1">Math</span></td>
      </tr>
      <tr>
        <td id="L28" class="blob-num js-line-number" data-line-number="28"></td>
        <td id="LC28" class="blob-code blob-code-inner js-file-line"><span class="pl-k">require</span> <span class="pl-s"><span class="pl-pds">&quot;</span>date.rb<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L29" class="blob-num js-line-number" data-line-number="29"></td>
        <td id="LC29" class="blob-code blob-code-inner js-file-line"><span class="pl-k">require</span> <span class="pl-s"><span class="pl-pds">&quot;</span>optparse<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L30" class="blob-num js-line-number" data-line-number="30"></td>
        <td id="LC30" class="blob-code blob-code-inner js-file-line"><span class="pl-k">require</span> <span class="pl-s"><span class="pl-pds">&quot;</span>optparse/date<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L31" class="blob-num js-line-number" data-line-number="31"></td>
        <td id="LC31" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L32" class="blob-num js-line-number" data-line-number="32"></td>
        <td id="LC32" class="blob-code blob-code-inner js-file-line"><span class="pl-k">def</span> <span class="pl-en">print_header</span>(<span class="pl-smi">y</span>, <span class="pl-smi">m</span>, <span class="pl-smi">d</span>, <span class="pl-smi">p</span>, <span class="pl-smi">w</span>)</td>
      </tr>
      <tr>
        <td id="L33" class="blob-num js-line-number" data-line-number="33"></td>
        <td id="LC33" class="blob-code blob-code-inner js-file-line">  print <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-cce">\n</span>&gt;&gt;&gt; Biorhythm &lt;&lt;&lt;<span class="pl-cce">\n</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L34" class="blob-num js-line-number" data-line-number="34"></td>
        <td id="LC34" class="blob-code blob-code-inner js-file-line">  printf <span class="pl-s"><span class="pl-pds">&quot;</span>The birthday %04d.%02d.%02d is a %s<span class="pl-cce">\n</span><span class="pl-pds">&quot;</span></span>, y, m, d, w</td>
      </tr>
      <tr>
        <td id="L35" class="blob-num js-line-number" data-line-number="35"></td>
        <td id="LC35" class="blob-code blob-code-inner js-file-line">  printf <span class="pl-s"><span class="pl-pds">&quot;</span>Age in days: [%d]<span class="pl-cce">\n\n</span><span class="pl-pds">&quot;</span></span>, p</td>
      </tr>
      <tr>
        <td id="L36" class="blob-num js-line-number" data-line-number="36"></td>
        <td id="LC36" class="blob-code blob-code-inner js-file-line"><span class="pl-k">end</span></td>
      </tr>
      <tr>
        <td id="L37" class="blob-num js-line-number" data-line-number="37"></td>
        <td id="LC37" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L38" class="blob-num js-line-number" data-line-number="38"></td>
        <td id="LC38" class="blob-code blob-code-inner js-file-line"><span class="pl-k">def</span> <span class="pl-en">get_position</span>(<span class="pl-smi">z</span>)</td>
      </tr>
      <tr>
        <td id="L39" class="blob-num js-line-number" data-line-number="39"></td>
        <td id="LC39" class="blob-code blob-code-inner js-file-line">  pi <span class="pl-k">=</span> <span class="pl-c1">Math</span>::<span class="pl-c1">PI</span></td>
      </tr>
      <tr>
        <td id="L40" class="blob-num js-line-number" data-line-number="40"></td>
        <td id="LC40" class="blob-code blob-code-inner js-file-line">  z <span class="pl-k">=</span> <span class="pl-c1">Integer</span>(z)</td>
      </tr>
      <tr>
        <td id="L41" class="blob-num js-line-number" data-line-number="41"></td>
        <td id="LC41" class="blob-code blob-code-inner js-file-line">  phys <span class="pl-k">=</span> (<span class="pl-c1">50.0</span> <span class="pl-k">*</span> (<span class="pl-c1">1.0</span> <span class="pl-k">+</span> sin((z <span class="pl-k">/</span> <span class="pl-c1">23.0</span> <span class="pl-k">-</span> (z <span class="pl-k">/</span> <span class="pl-c1">23</span>)) <span class="pl-k">*</span> <span class="pl-c1">360.0</span> <span class="pl-k">*</span> pi <span class="pl-k">/</span> <span class="pl-c1">180.0</span>))).to_i</td>
      </tr>
      <tr>
        <td id="L42" class="blob-num js-line-number" data-line-number="42"></td>
        <td id="LC42" class="blob-code blob-code-inner js-file-line">  emot <span class="pl-k">=</span> (<span class="pl-c1">50.0</span> <span class="pl-k">*</span> (<span class="pl-c1">1.0</span> <span class="pl-k">+</span> sin((z <span class="pl-k">/</span> <span class="pl-c1">28.0</span> <span class="pl-k">-</span> (z <span class="pl-k">/</span> <span class="pl-c1">28</span>)) <span class="pl-k">*</span> <span class="pl-c1">360.0</span> <span class="pl-k">*</span> pi <span class="pl-k">/</span> <span class="pl-c1">180.0</span>))).to_i</td>
      </tr>
      <tr>
        <td id="L43" class="blob-num js-line-number" data-line-number="43"></td>
        <td id="LC43" class="blob-code blob-code-inner js-file-line">  geist <span class="pl-k">=</span>(<span class="pl-c1">50.0</span> <span class="pl-k">*</span> (<span class="pl-c1">1.0</span> <span class="pl-k">+</span> sin((z <span class="pl-k">/</span> <span class="pl-c1">33.0</span> <span class="pl-k">-</span> (z <span class="pl-k">/</span> <span class="pl-c1">33</span>)) <span class="pl-k">*</span> <span class="pl-c1">360.0</span> <span class="pl-k">*</span> pi <span class="pl-k">/</span> <span class="pl-c1">180.0</span>))).to_i</td>
      </tr>
      <tr>
        <td id="L44" class="blob-num js-line-number" data-line-number="44"></td>
        <td id="LC44" class="blob-code blob-code-inner js-file-line">  <span class="pl-k">return</span> phys, emot, geist</td>
      </tr>
      <tr>
        <td id="L45" class="blob-num js-line-number" data-line-number="45"></td>
        <td id="LC45" class="blob-code blob-code-inner js-file-line"><span class="pl-k">end</span></td>
      </tr>
      <tr>
        <td id="L46" class="blob-num js-line-number" data-line-number="46"></td>
        <td id="LC46" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L47" class="blob-num js-line-number" data-line-number="47"></td>
        <td id="LC47" class="blob-code blob-code-inner js-file-line"><span class="pl-k">def</span> <span class="pl-en">prompt</span>(<span class="pl-smi">msg</span>)</td>
      </tr>
      <tr>
        <td id="L48" class="blob-num js-line-number" data-line-number="48"></td>
        <td id="LC48" class="blob-code blob-code-inner js-file-line">  <span class="pl-smi">$stderr</span>.print msg</td>
      </tr>
      <tr>
        <td id="L49" class="blob-num js-line-number" data-line-number="49"></td>
        <td id="LC49" class="blob-code blob-code-inner js-file-line">  <span class="pl-k">return</span> gets.chomp</td>
      </tr>
      <tr>
        <td id="L50" class="blob-num js-line-number" data-line-number="50"></td>
        <td id="LC50" class="blob-code blob-code-inner js-file-line"><span class="pl-k">end</span></td>
      </tr>
      <tr>
        <td id="L51" class="blob-num js-line-number" data-line-number="51"></td>
        <td id="LC51" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L52" class="blob-num js-line-number" data-line-number="52"></td>
        <td id="LC52" class="blob-code blob-code-inner js-file-line"><span class="pl-c">#</span></td>
      </tr>
      <tr>
        <td id="L53" class="blob-num js-line-number" data-line-number="53"></td>
        <td id="LC53" class="blob-code blob-code-inner js-file-line"><span class="pl-c"># main program</span></td>
      </tr>
      <tr>
        <td id="L54" class="blob-num js-line-number" data-line-number="54"></td>
        <td id="LC54" class="blob-code blob-code-inner js-file-line"><span class="pl-c">#</span></td>
      </tr>
      <tr>
        <td id="L55" class="blob-num js-line-number" data-line-number="55"></td>
        <td id="LC55" class="blob-code blob-code-inner js-file-line">options <span class="pl-k">=</span> {</td>
      </tr>
      <tr>
        <td id="L56" class="blob-num js-line-number" data-line-number="56"></td>
        <td id="LC56" class="blob-code blob-code-inner js-file-line">  <span class="pl-c1">:graph</span> =&gt; <span class="pl-c1">true</span>,</td>
      </tr>
      <tr>
        <td id="L57" class="blob-num js-line-number" data-line-number="57"></td>
        <td id="LC57" class="blob-code blob-code-inner js-file-line">  <span class="pl-c1">:date</span>  =&gt; <span class="pl-c1">Date</span>.today,</td>
      </tr>
      <tr>
        <td id="L58" class="blob-num js-line-number" data-line-number="58"></td>
        <td id="LC58" class="blob-code blob-code-inner js-file-line">  <span class="pl-c1">:days</span>  =&gt; <span class="pl-c1">9</span>,</td>
      </tr>
      <tr>
        <td id="L59" class="blob-num js-line-number" data-line-number="59"></td>
        <td id="LC59" class="blob-code blob-code-inner js-file-line">}</td>
      </tr>
      <tr>
        <td id="L60" class="blob-num js-line-number" data-line-number="60"></td>
        <td id="LC60" class="blob-code blob-code-inner js-file-line"><span class="pl-c1">ARGV</span>.options <span class="pl-k">do </span>|<span class="pl-smi">opts</span>|</td>
      </tr>
      <tr>
        <td id="L61" class="blob-num js-line-number" data-line-number="61"></td>
        <td id="LC61" class="blob-code blob-code-inner js-file-line">  opts.on(<span class="pl-s"><span class="pl-pds">&quot;</span>-b<span class="pl-pds">&quot;</span></span>, <span class="pl-s"><span class="pl-pds">&quot;</span>--birthday=DATE<span class="pl-pds">&quot;</span></span>, <span class="pl-c1">Date</span>, <span class="pl-s"><span class="pl-pds">&quot;</span>specify your birthday<span class="pl-pds">&quot;</span></span>){|<span class="pl-smi">v</span>|</td>
      </tr>
      <tr>
        <td id="L62" class="blob-num js-line-number" data-line-number="62"></td>
        <td id="LC62" class="blob-code blob-code-inner js-file-line">    options[<span class="pl-c1">:birthday</span>] <span class="pl-k">=</span> v</td>
      </tr>
      <tr>
        <td id="L63" class="blob-num js-line-number" data-line-number="63"></td>
        <td id="LC63" class="blob-code blob-code-inner js-file-line">  }</td>
      </tr>
      <tr>
        <td id="L64" class="blob-num js-line-number" data-line-number="64"></td>
        <td id="LC64" class="blob-code blob-code-inner js-file-line">  opts.on(<span class="pl-s"><span class="pl-pds">&quot;</span>--date=DATE<span class="pl-pds">&quot;</span></span>, <span class="pl-c1">Date</span>, <span class="pl-s"><span class="pl-pds">&quot;</span>specify date to show<span class="pl-pds">&quot;</span></span>){|<span class="pl-smi">v</span>|</td>
      </tr>
      <tr>
        <td id="L65" class="blob-num js-line-number" data-line-number="65"></td>
        <td id="LC65" class="blob-code blob-code-inner js-file-line">    options[<span class="pl-c1">:date</span>] <span class="pl-k">=</span> v</td>
      </tr>
      <tr>
        <td id="L66" class="blob-num js-line-number" data-line-number="66"></td>
        <td id="LC66" class="blob-code blob-code-inner js-file-line">  }</td>
      </tr>
      <tr>
        <td id="L67" class="blob-num js-line-number" data-line-number="67"></td>
        <td id="LC67" class="blob-code blob-code-inner js-file-line">  opts.on(<span class="pl-s"><span class="pl-pds">&quot;</span>-g<span class="pl-pds">&quot;</span></span>, <span class="pl-s"><span class="pl-pds">&quot;</span>--show-graph<span class="pl-pds">&quot;</span></span>, <span class="pl-c1">TrueClass</span>, <span class="pl-s"><span class="pl-pds">&quot;</span>show graph (default)<span class="pl-pds">&quot;</span></span>){|<span class="pl-smi">v</span>|</td>
      </tr>
      <tr>
        <td id="L68" class="blob-num js-line-number" data-line-number="68"></td>
        <td id="LC68" class="blob-code blob-code-inner js-file-line">    options[<span class="pl-c1">:graph</span>] <span class="pl-k">=</span> v</td>
      </tr>
      <tr>
        <td id="L69" class="blob-num js-line-number" data-line-number="69"></td>
        <td id="LC69" class="blob-code blob-code-inner js-file-line">  }</td>
      </tr>
      <tr>
        <td id="L70" class="blob-num js-line-number" data-line-number="70"></td>
        <td id="LC70" class="blob-code blob-code-inner js-file-line">  opts.on(<span class="pl-s"><span class="pl-pds">&quot;</span>-v<span class="pl-pds">&quot;</span></span>, <span class="pl-s"><span class="pl-pds">&quot;</span>--show-values<span class="pl-pds">&quot;</span></span>, <span class="pl-c1">TrueClass</span>, <span class="pl-s"><span class="pl-pds">&quot;</span>show values<span class="pl-pds">&quot;</span></span>){|<span class="pl-smi">v</span>|</td>
      </tr>
      <tr>
        <td id="L71" class="blob-num js-line-number" data-line-number="71"></td>
        <td id="LC71" class="blob-code blob-code-inner js-file-line">    options[<span class="pl-c1">:graph</span>] <span class="pl-k">=</span> <span class="pl-k">!</span>v</td>
      </tr>
      <tr>
        <td id="L72" class="blob-num js-line-number" data-line-number="72"></td>
        <td id="LC72" class="blob-code blob-code-inner js-file-line">  }</td>
      </tr>
      <tr>
        <td id="L73" class="blob-num js-line-number" data-line-number="73"></td>
        <td id="LC73" class="blob-code blob-code-inner js-file-line">  opts.on(<span class="pl-s"><span class="pl-pds">&quot;</span>--days=DAYS<span class="pl-pds">&quot;</span></span>, <span class="pl-c1">Integer</span>, <span class="pl-s"><span class="pl-pds">&quot;</span>graph range (only in effect for graph)<span class="pl-pds">&quot;</span></span>){|<span class="pl-smi">v</span>|</td>
      </tr>
      <tr>
        <td id="L74" class="blob-num js-line-number" data-line-number="74"></td>
        <td id="LC74" class="blob-code blob-code-inner js-file-line">    options[<span class="pl-c1">:days</span>] <span class="pl-k">=</span> v <span class="pl-k">-</span> <span class="pl-c1">1</span></td>
      </tr>
      <tr>
        <td id="L75" class="blob-num js-line-number" data-line-number="75"></td>
        <td id="LC75" class="blob-code blob-code-inner js-file-line">  }</td>
      </tr>
      <tr>
        <td id="L76" class="blob-num js-line-number" data-line-number="76"></td>
        <td id="LC76" class="blob-code blob-code-inner js-file-line">  opts.on_tail(<span class="pl-s"><span class="pl-pds">&quot;</span>-h<span class="pl-pds">&quot;</span></span>, <span class="pl-s"><span class="pl-pds">&quot;</span>--help<span class="pl-pds">&quot;</span></span>, <span class="pl-s"><span class="pl-pds">&quot;</span>show this message<span class="pl-pds">&quot;</span></span>){puts opts; exit}</td>
      </tr>
      <tr>
        <td id="L77" class="blob-num js-line-number" data-line-number="77"></td>
        <td id="LC77" class="blob-code blob-code-inner js-file-line">  <span class="pl-k">begin</span></td>
      </tr>
      <tr>
        <td id="L78" class="blob-num js-line-number" data-line-number="78"></td>
        <td id="LC78" class="blob-code blob-code-inner js-file-line">    opts.parse!</td>
      </tr>
      <tr>
        <td id="L79" class="blob-num js-line-number" data-line-number="79"></td>
        <td id="LC79" class="blob-code blob-code-inner js-file-line">  <span class="pl-k">rescue</span> =&gt; ex</td>
      </tr>
      <tr>
        <td id="L80" class="blob-num js-line-number" data-line-number="80"></td>
        <td id="LC80" class="blob-code blob-code-inner js-file-line">    puts <span class="pl-s"><span class="pl-pds">&quot;</span>Error: <span class="pl-pse">#{</span><span class="pl-s1">ex.message</span><span class="pl-pse"><span class="pl-s1">}</span></span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L81" class="blob-num js-line-number" data-line-number="81"></td>
        <td id="LC81" class="blob-code blob-code-inner js-file-line">    puts opts</td>
      </tr>
      <tr>
        <td id="L82" class="blob-num js-line-number" data-line-number="82"></td>
        <td id="LC82" class="blob-code blob-code-inner js-file-line">    exit</td>
      </tr>
      <tr>
        <td id="L83" class="blob-num js-line-number" data-line-number="83"></td>
        <td id="LC83" class="blob-code blob-code-inner js-file-line">  <span class="pl-k">end</span></td>
      </tr>
      <tr>
        <td id="L84" class="blob-num js-line-number" data-line-number="84"></td>
        <td id="LC84" class="blob-code blob-code-inner js-file-line"><span class="pl-k">end</span></td>
      </tr>
      <tr>
        <td id="L85" class="blob-num js-line-number" data-line-number="85"></td>
        <td id="LC85" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L86" class="blob-num js-line-number" data-line-number="86"></td>
        <td id="LC86" class="blob-code blob-code-inner js-file-line">bd <span class="pl-k">=</span> options[<span class="pl-c1">:birthday</span>] <span class="pl-k">||</span> <span class="pl-c1">Date</span>.parse(prompt(<span class="pl-s"><span class="pl-pds">&quot;</span>Your birthday (YYYYMMDD): <span class="pl-pds">&quot;</span></span>))</td>
      </tr>
      <tr>
        <td id="L87" class="blob-num js-line-number" data-line-number="87"></td>
        <td id="LC87" class="blob-code blob-code-inner js-file-line">dd <span class="pl-k">=</span> options[<span class="pl-c1">:date</span>] <span class="pl-k">||</span> <span class="pl-c1">Date</span>.today</td>
      </tr>
      <tr>
        <td id="L88" class="blob-num js-line-number" data-line-number="88"></td>
        <td id="LC88" class="blob-code blob-code-inner js-file-line">ausgabeart <span class="pl-k">=</span> options[<span class="pl-c1">:graph</span>] <span class="pl-k">?</span> <span class="pl-s"><span class="pl-pds">&quot;</span>g<span class="pl-pds">&quot;</span></span> : <span class="pl-s"><span class="pl-pds">&quot;</span>v<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L89" class="blob-num js-line-number" data-line-number="89"></td>
        <td id="LC89" class="blob-code blob-code-inner js-file-line">display_period <span class="pl-k">=</span> options[<span class="pl-c1">:days</span>]</td>
      </tr>
      <tr>
        <td id="L90" class="blob-num js-line-number" data-line-number="90"></td>
        <td id="LC90" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L91" class="blob-num js-line-number" data-line-number="91"></td>
        <td id="LC91" class="blob-code blob-code-inner js-file-line"><span class="pl-k">if</span> ausgabeart <span class="pl-k">==</span> <span class="pl-s"><span class="pl-pds">&quot;</span>v<span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L92" class="blob-num js-line-number" data-line-number="92"></td>
        <td id="LC92" class="blob-code blob-code-inner js-file-line">  print_header(bd.year, bd.month, bd.day, dd <span class="pl-k">-</span> bd, bd.strftime(<span class="pl-s"><span class="pl-pds">&quot;</span>%a<span class="pl-pds">&quot;</span></span>))</td>
      </tr>
      <tr>
        <td id="L93" class="blob-num js-line-number" data-line-number="93"></td>
        <td id="LC93" class="blob-code blob-code-inner js-file-line">  print <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-cce">\n</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L94" class="blob-num js-line-number" data-line-number="94"></td>
        <td id="LC94" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L95" class="blob-num js-line-number" data-line-number="95"></td>
        <td id="LC95" class="blob-code blob-code-inner js-file-line">  phys, emot, geist <span class="pl-k">=</span> get_position(dd <span class="pl-k">-</span> bd)</td>
      </tr>
      <tr>
        <td id="L96" class="blob-num js-line-number" data-line-number="96"></td>
        <td id="LC96" class="blob-code blob-code-inner js-file-line">  printf <span class="pl-s"><span class="pl-pds">&quot;</span>Biorhythm:   %04d.%02d.%02d<span class="pl-cce">\n</span><span class="pl-pds">&quot;</span></span>, dd.year, dd.month, dd.day</td>
      </tr>
      <tr>
        <td id="L97" class="blob-num js-line-number" data-line-number="97"></td>
        <td id="LC97" class="blob-code blob-code-inner js-file-line">  printf <span class="pl-s"><span class="pl-pds">&quot;</span>Physical:    %d%%<span class="pl-cce">\n</span><span class="pl-pds">&quot;</span></span>, phys</td>
      </tr>
      <tr>
        <td id="L98" class="blob-num js-line-number" data-line-number="98"></td>
        <td id="LC98" class="blob-code blob-code-inner js-file-line">  printf <span class="pl-s"><span class="pl-pds">&quot;</span>Emotional:   %d%%<span class="pl-cce">\n</span><span class="pl-pds">&quot;</span></span>, emot</td>
      </tr>
      <tr>
        <td id="L99" class="blob-num js-line-number" data-line-number="99"></td>
        <td id="LC99" class="blob-code blob-code-inner js-file-line">  printf <span class="pl-s"><span class="pl-pds">&quot;</span>Mental:      %d%%<span class="pl-cce">\n</span><span class="pl-pds">&quot;</span></span>, geist</td>
      </tr>
      <tr>
        <td id="L100" class="blob-num js-line-number" data-line-number="100"></td>
        <td id="LC100" class="blob-code blob-code-inner js-file-line">  print <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-cce">\n</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L101" class="blob-num js-line-number" data-line-number="101"></td>
        <td id="LC101" class="blob-code blob-code-inner js-file-line"><span class="pl-k">else</span></td>
      </tr>
      <tr>
        <td id="L102" class="blob-num js-line-number" data-line-number="102"></td>
        <td id="LC102" class="blob-code blob-code-inner js-file-line">  print_header(bd.year, bd.month, bd.day, dd <span class="pl-k">-</span> bd, bd.strftime(<span class="pl-s"><span class="pl-pds">&quot;</span>%a<span class="pl-pds">&quot;</span></span>))</td>
      </tr>
      <tr>
        <td id="L103" class="blob-num js-line-number" data-line-number="103"></td>
        <td id="LC103" class="blob-code blob-code-inner js-file-line">  print <span class="pl-s"><span class="pl-pds">&quot;</span>                     P=physical, E=emotional, M=mental<span class="pl-cce">\n</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L104" class="blob-num js-line-number" data-line-number="104"></td>
        <td id="LC104" class="blob-code blob-code-inner js-file-line">  print <span class="pl-s"><span class="pl-pds">&quot;</span>             -------------------------+-------------------------<span class="pl-cce">\n</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L105" class="blob-num js-line-number" data-line-number="105"></td>
        <td id="LC105" class="blob-code blob-code-inner js-file-line">  print <span class="pl-s"><span class="pl-pds">&quot;</span>                     Bad Condition    |    Good Condition<span class="pl-cce">\n</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L106" class="blob-num js-line-number" data-line-number="106"></td>
        <td id="LC106" class="blob-code blob-code-inner js-file-line">  print <span class="pl-s"><span class="pl-pds">&quot;</span>             -------------------------+-------------------------<span class="pl-cce">\n</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L107" class="blob-num js-line-number" data-line-number="107"></td>
        <td id="LC107" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L108" class="blob-num js-line-number" data-line-number="108"></td>
        <td id="LC108" class="blob-code blob-code-inner js-file-line">  (dd <span class="pl-k">-</span> bd).step(dd <span class="pl-k">-</span> bd <span class="pl-k">+</span> display_period) <span class="pl-k">do </span>|<span class="pl-smi">z</span>|</td>
      </tr>
      <tr>
        <td id="L109" class="blob-num js-line-number" data-line-number="109"></td>
        <td id="LC109" class="blob-code blob-code-inner js-file-line">    phys, emot, geist <span class="pl-k">=</span> get_position(z)</td>
      </tr>
      <tr>
        <td id="L110" class="blob-num js-line-number" data-line-number="110"></td>
        <td id="LC110" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L111" class="blob-num js-line-number" data-line-number="111"></td>
        <td id="LC111" class="blob-code blob-code-inner js-file-line">    printf <span class="pl-s"><span class="pl-pds">&quot;</span>%04d.%02d.%02d : <span class="pl-pds">&quot;</span></span>, dd.year, dd.month, dd.day</td>
      </tr>
      <tr>
        <td id="L112" class="blob-num js-line-number" data-line-number="112"></td>
        <td id="LC112" class="blob-code blob-code-inner js-file-line">    p <span class="pl-k">=</span> (phys <span class="pl-k">/</span> <span class="pl-c1">2.0</span> <span class="pl-k">+</span> <span class="pl-c1">0.5</span>).to_i</td>
      </tr>
      <tr>
        <td id="L113" class="blob-num js-line-number" data-line-number="113"></td>
        <td id="LC113" class="blob-code blob-code-inner js-file-line">    e <span class="pl-k">=</span> (emot <span class="pl-k">/</span> <span class="pl-c1">2.0</span> <span class="pl-k">+</span> <span class="pl-c1">0.5</span>).to_i</td>
      </tr>
      <tr>
        <td id="L114" class="blob-num js-line-number" data-line-number="114"></td>
        <td id="LC114" class="blob-code blob-code-inner js-file-line">    g <span class="pl-k">=</span> (geist <span class="pl-k">/</span> <span class="pl-c1">2.0</span> <span class="pl-k">+</span> <span class="pl-c1">0.5</span>).to_i</td>
      </tr>
      <tr>
        <td id="L115" class="blob-num js-line-number" data-line-number="115"></td>
        <td id="LC115" class="blob-code blob-code-inner js-file-line">    graph <span class="pl-k">=</span> <span class="pl-s"><span class="pl-pds">&quot;</span>.<span class="pl-pds">&quot;</span></span> <span class="pl-k">*</span> <span class="pl-c1">51</span></td>
      </tr>
      <tr>
        <td id="L116" class="blob-num js-line-number" data-line-number="116"></td>
        <td id="LC116" class="blob-code blob-code-inner js-file-line">    graph[<span class="pl-c1">25</span>] <span class="pl-k">=</span> <span class="pl-c1">?|</span></td>
      </tr>
      <tr>
        <td id="L117" class="blob-num js-line-number" data-line-number="117"></td>
        <td id="LC117" class="blob-code blob-code-inner js-file-line">    graph[p] <span class="pl-k">=</span> <span class="pl-c1">?P</span></td>
      </tr>
      <tr>
        <td id="L118" class="blob-num js-line-number" data-line-number="118"></td>
        <td id="LC118" class="blob-code blob-code-inner js-file-line">    graph[e] <span class="pl-k">=</span> <span class="pl-c1">?E</span></td>
      </tr>
      <tr>
        <td id="L119" class="blob-num js-line-number" data-line-number="119"></td>
        <td id="LC119" class="blob-code blob-code-inner js-file-line">    graph[g] <span class="pl-k">=</span> <span class="pl-c1">?M</span></td>
      </tr>
      <tr>
        <td id="L120" class="blob-num js-line-number" data-line-number="120"></td>
        <td id="LC120" class="blob-code blob-code-inner js-file-line">    print graph, <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-cce">\n</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L121" class="blob-num js-line-number" data-line-number="121"></td>
        <td id="LC121" class="blob-code blob-code-inner js-file-line">    dd <span class="pl-k">=</span> dd <span class="pl-k">+</span> <span class="pl-c1">1</span></td>
      </tr>
      <tr>
        <td id="L122" class="blob-num js-line-number" data-line-number="122"></td>
        <td id="LC122" class="blob-code blob-code-inner js-file-line">  <span class="pl-k">end</span></td>
      </tr>
      <tr>
        <td id="L123" class="blob-num js-line-number" data-line-number="123"></td>
        <td id="LC123" class="blob-code blob-code-inner js-file-line">  print <span class="pl-s"><span class="pl-pds">&quot;</span>             -------------------------+-------------------------<span class="pl-cce">\n\n</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L124" class="blob-num js-line-number" data-line-number="124"></td>
        <td id="LC124" class="blob-code blob-code-inner js-file-line"><span class="pl-k">end</span></td>
      </tr>
</table>

  </div>

</div>

<button type="button" data-facebox="#jump-to-line" data-facebox-class="linejump" data-hotkey="l" class="hidden">Jump to Line</button>
<div id="jump-to-line" style="display:none">
  <!-- </textarea> --><!-- '"` --><form accept-charset="UTF-8" action="" class="js-jump-to-line-form" method="get"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /></div>
    <input class="form-control linejump-input js-jump-to-line-field" type="text" placeholder="Jump to line&hellip;" aria-label="Jump to line" autofocus>
    <button type="submit" class="btn">Go</button>
</form></div>

  </div>
  <div class="modal-backdrop js-touch-events"></div>
</div>


    </div>
  </div>

    </div>

        <div class="container site-footer-container">
  <div class="site-footer" role="contentinfo">
    <ul class="site-footer-links right">
        <li><a href="https://github.com/contact" data-ga-click="Footer, go to contact, text:contact">Contact GitHub</a></li>
      <li><a href="https://developer.github.com" data-ga-click="Footer, go to api, text:api">API</a></li>
      <li><a href="https://training.github.com" data-ga-click="Footer, go to training, text:training">Training</a></li>
      <li><a href="https://shop.github.com" data-ga-click="Footer, go to shop, text:shop">Shop</a></li>
        <li><a href="https://github.com/blog" data-ga-click="Footer, go to blog, text:blog">Blog</a></li>
        <li><a href="https://github.com/about" data-ga-click="Footer, go to about, text:about">About</a></li>

    </ul>

    <a href="https://github.com" aria-label="Homepage" class="site-footer-mark" title="GitHub">
      <svg aria-hidden="true" class="octicon octicon-mark-github" height="24" version="1.1" viewBox="0 0 16 16" width="24"><path d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27.68 0 1.36.09 2 .27 1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.013 8.013 0 0 0 16 8c0-4.42-3.58-8-8-8z"></path></svg>
</a>
    <ul class="site-footer-links">
      <li>&copy; 2016 <span title="0.12908s from github-fe119-cp1-prd.iad.github.net">GitHub</span>, Inc.</li>
        <li><a href="https://github.com/site/terms" data-ga-click="Footer, go to terms, text:terms">Terms</a></li>
        <li><a href="https://github.com/site/privacy" data-ga-click="Footer, go to privacy, text:privacy">Privacy</a></li>
        <li><a href="https://github.com/security" data-ga-click="Footer, go to security, text:security">Security</a></li>
        <li><a href="https://status.github.com/" data-ga-click="Footer, go to status, text:status">Status</a></li>
        <li><a href="https://help.github.com" data-ga-click="Footer, go to help, text:help">Help</a></li>
    </ul>
  </div>
</div>



    

    <div id="ajax-error-message" class="ajax-error-message flash flash-error">
      <svg aria-hidden="true" class="octicon octicon-alert" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path d="M8.865 1.52c-.18-.31-.51-.5-.87-.5s-.69.19-.87.5L.275 13.5c-.18.31-.18.69 0 1 .19.31.52.5.87.5h13.7c.36 0 .69-.19.86-.5.17-.31.18-.69.01-1L8.865 1.52zM8.995 13h-2v-2h2v2zm0-3h-2V6h2v4z"></path></svg>
      <button type="button" class="flash-close js-flash-close js-ajax-error-dismiss" aria-label="Dismiss error">
        <svg aria-hidden="true" class="octicon octicon-x" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M7.48 8l3.75 3.75-1.48 1.48L6 9.48l-3.75 3.75-1.48-1.48L4.52 8 .77 4.25l1.48-1.48L6 6.52l3.75-3.75 1.48 1.48z"></path></svg>
      </button>
      Something went wrong with that request. Please try again.
    </div>


      
      <script crossorigin="anonymous" integrity="sha256-FJ2TOMJmUXKHCCXHj6SP3MpNQx0GfL9f2nEg2eOcxzg=" src="https://assets-cdn.github.com/assets/frameworks-149d9338c2665172870825c78fa48fdcca4d431d067cbf5fda7120d9e39cc738.js"></script>
      <script async="async" crossorigin="anonymous" integrity="sha256-uDmQVe4sVaUGHPTyksYWnoDo36HOD6HV+KrfNdjJvUw=" src="https://assets-cdn.github.com/assets/github-b8399055ee2c55a5061cf4f292c6169e80e8dfa1ce0fa1d5f8aadf35d8c9bd4c.js"></script>
      
      
      
      
      
      
    <div class="js-stale-session-flash stale-session-flash flash flash-warn flash-banner hidden">
      <svg aria-hidden="true" class="octicon octicon-alert" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path d="M8.865 1.52c-.18-.31-.51-.5-.87-.5s-.69.19-.87.5L.275 13.5c-.18.31-.18.69 0 1 .19.31.52.5.87.5h13.7c.36 0 .69-.19.86-.5.17-.31.18-.69.01-1L8.865 1.52zM8.995 13h-2v-2h2v2zm0-3h-2V6h2v4z"></path></svg>
      <span class="signed-in-tab-flash">You signed in with another tab or window. <a href="">Reload</a> to refresh your session.</span>
      <span class="signed-out-tab-flash">You signed out in another tab or window. <a href="">Reload</a> to refresh your session.</span>
    </div>
    <div class="facebox" id="facebox" style="display:none;">
  <div class="facebox-popup">
    <div class="facebox-content" role="dialog" aria-labelledby="facebox-header" aria-describedby="facebox-description">
    </div>
    <button type="button" class="facebox-close js-facebox-close" aria-label="Close modal">
      <svg aria-hidden="true" class="octicon octicon-x" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path d="M7.48 8l3.75 3.75-1.48 1.48L6 9.48l-3.75 3.75-1.48-1.48L4.52 8 .77 4.25l1.48-1.48L6 6.52l3.75-3.75 1.48 1.48z"></path></svg>
    </button>
  </div>
</div>

  </body>
</html>

