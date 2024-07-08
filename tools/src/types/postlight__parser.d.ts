declare module '@postlight/parser' {
  export interface ParserOptions {
    contentType?: 'html' | 'markdown' | 'text';
  }

  export interface ParserResult {
    title?: string;
    content?: string;
    author?: string;
    date_published?: string;
    lead_image_url?: string;
    dek?: string;
    next_page_url?: string;
    url?: string;
    domain?: string;
    excerpt?: string;
    word_count?: number;
    direction?: string;
    total_pages?: number;
    rendered_pages?: number;
  }

  function parse(url: string, options?: ParserOptions): Promise<ParserResult>;
} 