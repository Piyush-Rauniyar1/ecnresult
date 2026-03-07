import './globals.css';
import type { Metadata } from 'next';
import { Inter } from 'next/font/google';

const inter = Inter({ subsets: ['latin'] });

export const metadata: Metadata = {
  title: 'Nepal Election 2082 Results',
  description: 'Live real-time vote counting results for Nepal House of Representatives General Election',
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en" suppressHydrationWarning>
      <body className={`${inter.className} bg-gray-50 min-h-screen flex flex-col`}>
        <header className="bg-blue-900 border-b-4 border-red-600 sticky top-0 z-50 shadow-md">
          <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 h-16 flex items-center justify-between">
            <div className="flex items-center space-x-3">
              <span className="text-2xl">🇳🇵</span>
              <h1 className="text-white font-black tracking-tight text-xl">
                Nepal Election 2082
              </h1>
            </div>
            <div className="text-blue-200 text-sm font-medium hidden sm:block">
              Live Results Platform
            </div>
          </div>
        </header>
        <main className="flex-grow pb-16">
          {children}
        </main>
        <footer className="bg-white border-t py-8 mt-auto">
          <div className="max-w-7xl mx-auto px-4 text-center text-sm text-gray-500 font-medium">
            <p>Data scraped automatically from the official Election Commission portal.</p>
            <p className="mt-1">For demonstration purposes only.</p>
          </div>
        </footer>
      </body>
    </html>
  );
}
